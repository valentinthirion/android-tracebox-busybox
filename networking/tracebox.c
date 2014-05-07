/*
 Tracebox implementation
 Valentin THIRION
 2014
 */

#define TRACEROUTE_SO_DEBUG 0

#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <string.h>
#include <errno.h>

#include <net/if.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netinet/ip.h>
#include <netinet/ip_icmp.h>

#include "libbb.h"
#include "inet_common.h"

#include <unistd.h>
#include <sys/socket.h>

#ifndef IPPROTO_ICMP
# define IPPROTO_ICMP            1
#endif
#ifndef IPPROTO_IP
# define IPPROTO_IP              0
#endif
#ifndef IPPROTO_TCP
# define IPPROTO_TCP             6
#endif

#define DATAGRAM_SIZE            4096

enum {
	SIZEOF_ICMP_HDR = 8,
	rcvsock = 3, /* receive (icmp) socket file descriptor */
	sndsock = 4, /* send (tcp) socket file descriptor */
};

struct tcp_option_mss
{
    uint8_t     kind;               /* 2 */
    uint8_t     len;                /* 4 */
    uint16_t    mss;
}           __attribute__((packed));

struct tcphdr_mss
{
    struct tcphdr tcphdr;
    struct tcp_option_mss   mss;
};

struct globals {
	len_and_sockaddr *dest_lsa;
	int packlen;                    /* total length of packet */
	int pmtu;                       /* Path MTU Discovery (RFC1191) */
	uint32_t ident;
	uint16_t port; // 32768 + 666;  /* start udp dest port # for probe packets */
	int waittime; // 5;             /* time to wait for response (in seconds) */
    char sent_datagram[DATAGRAM_SIZE]; // SENT
    char recv_pkt[DATAGRAM_SIZE];    /* last inbound (icmp) packet */
    
    struct ifreq ifr;                /* Interface */
    char * local_addr;               /* LOCAL IP */

    /* ANALYSE DATA */
    struct iphdr *sent_ip;
    struct iphdr *quoted_ip;
    int quoted_ip_offset;
    int quoted_tcp_offset;
    bool partial;
};

// Used to compute the TCP checksum
struct pseudo_header
{
    u_int32_t source_address;
    u_int32_t dest_address;
    u_int8_t placeholder;
    u_int8_t protocol;
    u_int16_t tcp_length;
};

#define G (*ptr_to_globals)
#define dest_lsa  (G.dest_lsa )
#define packlen   (G.packlen  )
#define pmtu      (G.pmtu     )
#define ident     (G.ident    )
#define port      (G.port     )
#define waittime  (G.waittime )
#define ifr       (G.ifr      )
#define quoted_ip_offset (G.quoted_ip_offset)
#define quoted_tcp_offset (G.quoted_tcp_offset)
#define sent_ip (G.sent_ip)
#define quoted_ip (G.quoted_ip)
#define partial (G.partial)
#define local_addr (G.local_addr )
#define sent_datagram (G.sent_datagram )
#define recv_pkt  (G.recv_pkt )
#define gwlist    (G.gwlist   )
#define INIT_G() do { \
SET_PTR_TO_GLOBALS(xzalloc(sizeof(G))); \
port = 80; \
waittime = 5; \
} while (0)

#define outicmp ((struct icmp *)(outip + 1))


/* libbb candidate? tftp uses this idiom too */
static len_and_sockaddr* dup_sockaddr(const len_and_sockaddr *lsa)
{
	len_and_sockaddr *new_lsa = xzalloc(LSA_LEN_SIZE + lsa->len);
	memcpy(new_lsa, lsa, LSA_LEN_SIZE + lsa->len);
	return new_lsa;
}

// Generic checksum calculation function
static unsigned short
csum(unsigned short *ptr,int nbytes)
{
    register long sum;
    unsigned short oddbyte;
    register short answer;
    
    sum=0;
    while(nbytes>1) {
        sum+=*ptr++;
        nbytes-=2;
    }
    if(nbytes==1) {
        oddbyte=0;
        *((u_char*)&oddbyte)=*(u_char*)ptr;
        sum+=oddbyte;
    }
    
    sum = (sum>>16)+(sum & 0xffff);
    sum = sum + (sum>>16);
    answer=(short)~sum;
    
    return(answer);
}

// This function casts an IP packet from an char *
static struct iphdr *
castToIP(char datagram[], int offset)
{
    struct iphdr *ip;
    ip = (struct iphdr *) (datagram + offset);
    // Version
    // HL
    //DSCP
    //ECN
    ip->tot_len = (((int) datagram[offset + 2] << 8) + ((int) datagram[offset + 3]));
    ip->id = (((int) datagram[offset + 4] << 8) + ((int) datagram[offset + 5]));
    //ip->offset = (short) (datagram + offset + 32 + 19);
    ip->ttl = (int) datagram[offset + 8];
    ip->protocol = (int) datagram[offset + 8 + 1];
    ip->check = (((int) datagram[offset + 10] << 8) + ((int) datagram[offset + 11]));
    ip->saddr = (((unsigned long) datagram[offset + 12] << 24)
                 + ((unsigned long) datagram[offset + 13] << 16)
                 + ((unsigned long) datagram[offset + 14] << 8)
                 + ((unsigned long) datagram[offset + 15]));

    ip->daddr = (((unsigned long) datagram[offset + 16] << 24)
                 + ((unsigned long) datagram[offset + 17] << 16)
                 + ((unsigned long) datagram[offset + 18] << 8)
                 + ((unsigned long) datagram[offset + 19]));
    
    return ip;
}

// This function casts an ICMP packet from an char *
static struct icmp *
castToICMP(char datagram[], int offset)
{
    struct icmp *icmp;
    icmp = (struct icmp *) (datagram + offset);

    return icmp;
}

// This function casts a TCP packet from an char *
static struct tcphdr *
castToTCP(char datagram[], int offset)
{
    struct tcphdr *tcp;
    tcp = (struct tcphdr *) (datagram + offset);
    
    //tcp->th_sport = (unsigned int) (datagram + offset);
    //tcp->th_dport = (uint16_t) (datagram + offset + 16);
    //tcp->th_seq = (uint32_t) (datagram + offset + 32);
    //tcp->th_ack = (uint32_t) (datagram + offset + 64);
    // DATA OFFSET ...
    //tcp->th_win = (uint16_t) (datagram + offset + 96 + 16);
    //tcp->th_sum = (uint16_t) (datagram + offset + 128);
    //tcp->urg_ptr = (__u16) (datagram + offset + 128 + 16);
    // OPTIONS
    
    return tcp;
}

static void
send_probe(char datagram[], int seq, int ttl, len_and_sockaddr *from_lsa)
{
    dest_lsa->u.sin.sin_port = htons(80);

    memset(datagram, 0, 4096);	/* zero out the buffer */
    char *pseudogram;

    struct tcphdr *tcph;
    struct tcphdr_mss *tcp_header;
    
    // --- VALUES SETTING
    
    // -------- TCP
    tcp_header = (struct tcphdr_mss *) (datagram + sizeof (struct ip));
    tcp_header->mss.kind = 2;
    tcp_header->mss.len = 4;
    tcp_header->mss.mss = htons(1460);

    tcp_header->tcphdr.source = htons(32768 + 666 + seq);
    tcp_header->tcphdr.dest = htons(port);
    tcp_header->tcphdr.seq = htonl(rand()); // seq
    tcp_header->tcphdr.ack_seq = htonl(0);
    tcp_header->tcphdr.doff = (sizeof(struct tcphdr_mss)) / 4; // 6;  //tcp header size
    tcp_header->tcphdr.res1 = 0;
    tcp_header->tcphdr.fin = 0;
    tcp_header->tcphdr.syn = 1;
    tcp_header->tcphdr.rst = 0;
    tcp_header->tcphdr.psh = 0;
    tcp_header->tcphdr.ack = 0;
    tcp_header->tcphdr.urg = 0;
    tcp_header->tcphdr.window = htons(5840);
    tcp_header->tcphdr.check = 0; /* Will calculate the checksum with pseudo-header later */
    tcp_header->tcphdr.urg_ptr = 0;

    // -------- IP
    sent_ip = (struct iphdr *) datagram;
    sent_ip->ihl = 5;
    sent_ip->version = 4;
    sent_ip->tos = 0;
    sent_ip->tot_len = sizeof (struct iphdr) + sizeof (struct tcphdr_mss);
    sent_ip->id = htonl(rand()); //Id of this packet
    sent_ip->frag_off = 0;
    sent_ip->ttl = ttl;
    sent_ip->protocol = IPPROTO_TCP;
    sent_ip->check = 0;      //Set to 0 before calculating checksum
    sent_ip->saddr = inet_addr(local_addr);
    sent_ip->daddr = dest_lsa->u.sin.sin_addr.s_addr;
    // IP Checksum
    sent_ip->check = csum((unsigned short *) datagram, sent_ip->ihl);

    // -------- TCP checksum
    struct pseudo_header psh;
    psh.source_address = inet_addr(local_addr);
    psh.dest_address = dest_lsa->u.sin.sin_addr.s_addr;
    psh.placeholder = 0;
    psh.protocol = IPPROTO_TCP;
    psh.tcp_length = htons(sizeof(struct tcphdr));

    int psize;
    psize = sizeof(struct pseudo_header) + sizeof(struct tcphdr_mss);
    pseudogram = malloc(psize);

    memcpy(pseudogram , (char*) &psh , sizeof(struct pseudo_header));
    memcpy(pseudogram + sizeof(struct pseudo_header) , tcp_header , sizeof(struct tcphdr_mss));

    tcp_header->tcphdr.check = csum((unsigned short*) pseudogram , psize);
    // --- END OF VALUES SETTING
    
    // SEND
    int sent;
    sent = sendto(sndsock, datagram, sent_ip->tot_len, 0, &dest_lsa->u.sa, dest_lsa->len);
    if (sent == 0)
        printf("Error! Send=%d\n", sent);
    return;
}

static int
wait_for_reply(len_and_sockaddr *from_lsa, struct sockaddr *to, unsigned *timestamp_us, int *left_ms)
{
	struct pollfd pfd[1];
	int read_len = 0;
    
	pfd[0].fd = rcvsock;
	pfd[0].events = POLLIN;
	if (*left_ms >= 0 && safe_poll(pfd, 1, *left_ms) > 0) {
		unsigned t;
        memset (recv_pkt, 0, 4096);
        
		read_len = recv_from_to(rcvsock,
                                recv_pkt, 4096,
                                MSG_DONTWAIT,
                                &from_lsa->u.sa, to, from_lsa->len);
        
		t = monotonic_us();
		*left_ms -= (t - *timestamp_us) / 1000;
		*timestamp_us = t;
	}

	return read_len;
}

static int
packet_ok(int read_len, len_and_sockaddr *from_lsa, struct sockaddr *to, int seq)
{
	unsigned char type, code;
	int main_hlen, quoted_hlen;
    int quoted_data_len = read_len;
    
    // GET IP
    struct iphdr *ip;
    ip = castToIP(recv_pkt, 0);
    
    // Test length
	main_hlen = ip->ihl << 2;
    
	if (read_len < main_hlen + ICMP_MINLEN)
    {
		printf("packet too short (%d bytes)\n", read_len);
		return 0;
	}
    
	read_len -= main_hlen; // get the length of the ICMP
    quoted_data_len -= main_hlen; // Quoted = total - IP_hlen (20 bytes)

    // Test if ICMP OR TCP
    //printf("IP PROTO : %d\n", ip->protocol);

    if (ip->protocol == 1) // ICMP
    {
        // Get ICMP
        struct icmp *icp;
        icp = castToICMP(recv_pkt, main_hlen); // (struct icmp *)(recv_pkt + hlen);
        type = icp->icmp_type;
        code = icp->icmp_code;
    
        if ((type == ICMP_TIMXCEED && code == ICMP_TIMXCEED_INTRANS)
            || type == ICMP_UNREACH
            || type == ICMP_ECHOREPLY
            )
        {
            quoted_data_len -= 8; // Quoted = rest - ICMP_hlen (8 bytes)

            //quoted_ip = castToIP(recv_pkt, main_hlen + 8); // &icp->icmp_ip; // Quoted IP

            quoted_ip_offset = main_hlen + SIZEOF_ICMP_HDR;
            quoted_ip = castToIP(recv_pkt, quoted_ip_offset); // Quoted IP

            //printf("quoted version= %d\n", quoted_ip->version);
            quoted_hlen = quoted_ip->ihl << 2; // Quoted IP header lenght

            quoted_tcp_offset = main_hlen + SIZEOF_ICMP_HDR + quoted_hlen;

            int expected_quoted_ip_len;
            expected_quoted_ip_len = quoted_ip->tot_len << 2;

            // TEST IF PARTIAL
            if (expected_quoted_ip_len > quoted_data_len)
            {
                partial = true;
                //printf("PARTIAL ICMP\n");
            }
            else
            {
                partial = false;
                //printf("FULL ICMP\n");
            }

            return (type == ICMP_TIMXCEED ? -1 : code + 1);
        }
    }
    else if (ip->protocol == 6) // TCP
    {
        struct tcphdr * tcp;
        tcp = castToTCP(recv_pkt, main_hlen);

        printf("FLAGS: %x\n", recv_pkt[main_hlen + 13]);
        printf("ACK: %d\n", tcp->ack);
    }
    
	return 0;
}

static void
print(const struct sockaddr *from)
{
    char *ina = xmalloc_sockaddr2dotted_noport(from);
    printf("%s ", ina);
}

static void
print_delta_ms(unsigned t1p, unsigned t2p)
{
	unsigned tt = t2p - t1p;
	printf("  %u.%03u ms\n", tt / 1000, tt % 1000);
}

//(struct iphdr *sent_ip, struct iphdr *received_ip)
static void
compare_ip_packets (char * sent, int s_offset, char * rec, int r_offset, int len)
{
    /*int i;
    printf("\n");
    for (i = 0; i < 12; i++)
        printf("%x|", sent[s_offset + i]);
    printf("\n");
    for (i = 0; i < 12; i++)
        printf("%x|", rec[r_offset + i]);
    printf("\n");
    */

    // Version && HL
    if (sent[s_offset + 0] != rec[r_offset + 0])
    {
        printf("IP::HeaderLength ");
    }

    // DSCP/ECN
    if (sent[s_offset + 1] != rec[r_offset + 1])
    {
        printf("IP::DSCP/ECN ");
    }

    // TotalLength
    if ((sent[s_offset + 2] != rec[r_offset + 2]) || (sent[s_offset + 3] != rec[r_offset + 3]))
    {
        printf("IP::TotalLenght ");
    }

    // ID
    if ((sent[s_offset + 4] != rec[r_offset + 5]) || (sent[s_offset + 5] != rec[r_offset + 4]))
    {
        printf("IP::ID ");
    }

    // Flags
    if (sent[s_offset + 6] != rec[r_offset + 6])
    {
        printf("IP::Flags ");
    }

    // Offset
    if (sent[s_offset + 7] != rec[r_offset + 7])
    {
        printf("IP::Offset ");
    }

    // TTL
    if (sent[s_offset + 8] != rec[r_offset + 8])
    {
        //printf("IP::TTL ");
    }

    // Protocol
    if (sent[s_offset + 9] != rec[r_offset + 9])
    {
        printf("IP::Protocol ");
    }

    // Checksum
    if ((sent[s_offset + 10] != rec[r_offset + 11]) || (sent[s_offset + 11] != rec[r_offset + 10]))
    {
        printf("IP::Checksum ");
    }
}

static void
compare_tcp_packets (char * sent, int s_offset, char * rec, int r_offset, int len)
{
    /*
     int i;
     printf("\n");
    for (i = 0; i < len; i++)
    {
        printf("%x|", sent[s_offset + i]);
    }
    printf("\n");
    for (i = 0; i < len; i++)
    {
        printf("%x|", rec[r_offset + i]);
    }
    printf("\n");
     */
    
    // S_Port
    if ((len >= 2) &&
        ((sent[s_offset + 0] != rec[r_offset + 0]) || (sent[s_offset + 1] != rec[r_offset + 1])))
    {
        printf("TCP::SourcePort ");
        //printf("%x%x | %x%x\n", sent[s_offset + 0], sent[s_offset + 1], rec[r_offset + 0], rec[r_offset + 1]);
    }

    // D_Port
    if ((len >= 4) &&
        ((sent[s_offset + 2] != rec[r_offset + 2]) || (sent[s_offset + 3] != rec[r_offset + 3])))
    {
        printf("TCP::DestPort ");
        //printf("%x%x | %x%x\n", sent[s_offset + 2], sent[s_offset + 3], rec[r_offset + 2], rec[r_offset + 3]);
    }

    // Seq
    if ((len >= 8) &&
        ((sent[s_offset + 4] != rec[r_offset + 4])
         || (sent[s_offset + 5] != rec[r_offset + 5])
         || (sent[s_offset + 6] != rec[r_offset + 6])
         || (sent[s_offset + 7] != rec[r_offset + 7])))
    {
        printf("TCP::SeqNumber ");
        //printf("%x%x%x%x | %x%x%x%x\n", sent[s_offset + 4], sent[s_offset + 5], sent[s_offset + 6], sent[s_offset + 7], rec[r_offset + 4], rec[r_offset + 5], rec[r_offset + 6], rec[r_offset + 7]);
    }

    // Offset

    // Window size
    if ((len >= 16) &&
        ((sent[s_offset + 14] != rec[r_offset + 14]) || (sent[s_offset + 15] != rec[r_offset + 15])))
    {
        printf("TCP::WindowSize ");
        //printf("%x%x | %x%x\n", sent[s_offset + 14], sent[s_offset + 15], rec[r_offset + 14], rec[r_offset + 15]);
    }

    // Checksum
    if ((len >= 18) &&
        ((sent[s_offset + 16] != rec[r_offset + 16]) || (sent[s_offset + 17] != rec[r_offset + 17])))
    {
        printf("TCP::WindowSize ");
        //printf("%x%x | %x%x\n", sent[s_offset + 16], sent[s_offset + 17], rec[r_offset + 16], rec[r_offset + 17]);
    }
    
}

static int
common_tracebox_main(char **argv)
{
	int max_ttl = 30;
	int nprobes = 3;
	int first_ttl = 1;
    int starts_max = 20;
	unsigned pausemsecs = 0;
	char *dest_str;
    
	int ttl;
	int seq;
	len_and_sockaddr *from_lsa;
	struct sockaddr *lastaddr;
	struct sockaddr *to;

    // Do the variablesinitialization
	INIT_G();

    // Destination
    {
        dest_lsa = xhost2sockaddr(argv[1], port);
        dest_str = xmalloc_sockaddr2dotted_noport(&dest_lsa->u.sa);
        printf("traceboxing to %s (%s)\n", argv[1], dest_str);
    }
    
	// Ensure the socket fds won't be 0, 1 or 2
	bb_sanitize_stdio();
    
    // CREATE SOCKETS
    {
        // SEND
        xmove_fd(socket(PF_INET, SOCK_RAW, IPPROTO_TCP), sndsock); // This is for TCP
        if (sndsock < 0)
        {
            printf("ERROR opening send socket\n");
            return 1;
        }

        // AVERT THE KERNEL TO NOT PUT ITS OWN HEADERS
        int one;
        one = 1;
        const int *val;
        val = &one;
        if (setsockopt(sndsock, IPPROTO_IP, IP_HDRINCL, val, sizeof(one)) < 0)
            printf ("Warning: Cannot set HDRINCL!\n");
        
        // RECEIVE
        xmove_fd(xsocket(AF_INET, SOCK_RAW, IPPROTO_ICMP), rcvsock); // This is for UDP
        if (rcvsock < 0)
        {
            printf("ERROR opening received socket\n");
            return 1;
        }
        
        // TCP
        /*if (connect(sndsock, &dest_lsa->u.sa, dest_lsa->len) < 0)
        {
            printf("ERROR connecting");
            return 1;
        }*/
    }
    
    // GET LOCAL IP ADDRESS
    {
        ifr.ifr_addr.sa_family = AF_INET;
        strncpy(ifr.ifr_name, "eth0", IFNAMSIZ-1);
        
        ioctl(sndsock, SIOCGIFADDR, &ifr);
        local_addr = inet_ntoa(((struct sockaddr_in *)&ifr.ifr_addr)->sin_addr);
    }

    // PROCESS ID
	ident = getpid();
    
	// Revert to non-privileged user after opening sockets
	xsetgid(getgid());
	xsetuid(getuid());
    
	from_lsa = dup_sockaddr(dest_lsa);
	lastaddr = xzalloc(dest_lsa->len);
	to = xzalloc(dest_lsa->len);
	seq = 0;
    
    int got_dest;
    got_dest = 0;
    int start_counter = 0;
    
	for (ttl = first_ttl; ttl <= max_ttl; ++ttl) {
		int probe;
		int unreachable = 0; /* counter */
		int gotlastaddr = 0; /* flags */
		int got_there = 0;
        int got_host = 0;
        
        if (got_dest == 1)
            break;
        
		printf("%2d ", ttl);
		for (probe = 0; probe < nprobes; ++probe) {
            
            if (got_host == 1)
                break;
            
			int read_len;
			unsigned t1, t2;
			int left_ms;
            
			fflush_all();
			if (probe != 0 && pausemsecs > 0)
				usleep(pausemsecs * 1000);
            
			send_probe(sent_datagram, ++seq, ttl, from_lsa); // use the char[] "sent_datagram"
			t2 = t1 = monotonic_us();
            
			left_ms = waittime * 1000;
			while ((read_len = wait_for_reply(from_lsa, to, &t2, &left_ms)) != 0)
            {
                if (read_len < 0)
					continue;

                // Check packets
				int icmp_code;
                icmp_code = packet_ok(read_len, from_lsa, to, seq);

				// Skip short packet
				if (icmp_code == 0)
					continue;
                
				if (!gotlastaddr || (memcmp(lastaddr, &from_lsa->u.sa, from_lsa->len) != 0)) {
					print(&from_lsa->u.sa);
					memcpy(lastaddr, &from_lsa->u.sa, from_lsa->len);
					gotlastaddr = 1;
                    got_host = 1; // TBOX EDIT
				}
                
				//print_delta_ms(t1, t2);
                /*int i;
                printf("\n");
                for (i = 0; i < read_len; i++)
                    printf("%x|", sent_datagram[i]);
                printf("\n");
                for (i = quoted_ip_offset; i < read_len; i++)
                    printf("%x|", recv_pkt[i]);
                printf("\n");
                */

                start_counter = 0; // Init the counter because we found an host

                /* ---- IP -------------------- */
                compare_ip_packets(sent_datagram, 0, recv_pkt, quoted_ip_offset, (sent_ip->ihl >= quoted_ip->ihl ? quoted_ip->ihl << 2 : sent_ip->ihl << 2));
                
                /* ---- TCP ------------------- */
                int tcp_len = read_len - 20 - 8 - (quoted_ip->ihl << 2);
                compare_tcp_packets(sent_datagram, 20, recv_pkt, quoted_tcp_offset, tcp_len);

                /* ---- STOP ------------------ */
                char *ina = xmalloc_sockaddr2dotted_noport(&from_lsa->u.sa);
                if (memcmp(ina, dest_str, 15) == 0)
                {
                    printf("%s (got destination)\n", ina);
                    got_dest = 1;
                    got_host = 1;
                }
                /*
                 struct iphdr * received_ip;
                received_ip = castToIP(recv_pkt, 0);
                if (sent_ip->daddr == received_ip->saddr)
                {
                    char *ina;
                    ina = xmalloc_sockaddr2dotted_noport(&from_lsa->u.sa);
                    printf("%s (Got destination)\n", ina);
                    got_dest = 1;
                    got_host = 1;
                }*/
                
				// End the loop for this ttl
				if (icmp_code == -1)
					break;
			} // while (wait and read a packet)
            
			// there was no packet at all?
			if (read_len == 0)
            {
				printf("  *");
                start_counter++; // Increase the counter of stars
                if (start_counter == starts_max)
                    break;
            }
		}
        
		bb_putchar('\n');
		if (got_there || (unreachable > 0 && unreachable >= nprobes - 1))
			break;

        /* ---- STOP ------------------ */
        if (start_counter == starts_max)
            break;
	}

    close(sndsock);
    close(rcvsock);
    
	return 0;
}

int tracebox_main(int argc, char *argv[])
{
    return common_tracebox_main(argv);
}
