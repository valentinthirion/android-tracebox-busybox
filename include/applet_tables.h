/* This is a generated file, don't edit */

#define NUM_APPLETS 9

const char applet_names[] ALIGN1 = ""
"insmod" "\0"
"lsmod" "\0"
"ping" "\0"
"rmmod" "\0"
"su" "\0"
"tracebox" "\0"
"traceroute" "\0"
"whoami" "\0"
"whois" "\0"
;

#ifndef SKIP_applet_main
int (*const applet_main[])(int argc, char **argv) = {
insmod_main,
lsmod_main,
ping_main,
rmmod_main,
su_main,
tracebox_main,
traceroute_main,
whoami_main,
whois_main,
};
#endif

const uint16_t applet_nameofs[] ALIGN2 = {
0x0000,
0x0007,
0x400d,
0x0012,
0x8018,
0x401b,
0x4024,
0x002f,
0x0036,
};

const uint8_t applet_install_loc[] ALIGN1 = {
0x22,
0x21,
0x11,
0x11,
0x01,
};
