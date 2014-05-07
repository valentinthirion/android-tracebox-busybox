cmd_libbb/login.o := gcc -Wp,-MD,libbb/.login.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.22.1)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -Os  -march=i386 -mpreferred-stack-boundary=2    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(login)"  -D"KBUILD_MODNAME=KBUILD_STR(login)" -c -o libbb/login.o libbb/login.c

deps_libbb/login.o := \
  libbb/login.c \
  include/libbb.h \
    $(wildcard include/config/feature/shadowpasswds.h) \
    $(wildcard include/config/use/bb/shadow.h) \
    $(wildcard include/config/selinux.h) \
    $(wildcard include/config/feature/utmp.h) \
    $(wildcard include/config/locale/support.h) \
    $(wildcard include/config/use/bb/pwd/grp.h) \
    $(wildcard include/config/lfs.h) \
    $(wildcard include/config/feature/buffers/go/on/stack.h) \
    $(wildcard include/config/feature/buffers/go/in/bss.h) \
    $(wildcard include/config/feature/ipv6.h) \
    $(wildcard include/config/feature/seamless/xz.h) \
    $(wildcard include/config/feature/seamless/lzma.h) \
    $(wildcard include/config/feature/seamless/bz2.h) \
    $(wildcard include/config/feature/seamless/gz.h) \
    $(wildcard include/config/feature/seamless/z.h) \
    $(wildcard include/config/feature/check/names.h) \
    $(wildcard include/config/feature/prefer/applets.h) \
    $(wildcard include/config/long/opts.h) \
    $(wildcard include/config/feature/getopt/long.h) \
    $(wildcard include/config/feature/pidfile.h) \
    $(wildcard include/config/feature/syslog.h) \
    $(wildcard include/config/feature/individual.h) \
    $(wildcard include/config/echo.h) \
    $(wildcard include/config/printf.h) \
    $(wildcard include/config/test.h) \
    $(wildcard include/config/kill.h) \
    $(wildcard include/config/chown.h) \
    $(wildcard include/config/ls.h) \
    $(wildcard include/config/xxx.h) \
    $(wildcard include/config/route.h) \
    $(wildcard include/config/feature/hwib.h) \
    $(wildcard include/config/desktop.h) \
    $(wildcard include/config/feature/crond/d.h) \
    $(wildcard include/config/use/bb/crypt.h) \
    $(wildcard include/config/feature/adduser/to/group.h) \
    $(wildcard include/config/feature/del/user/from/group.h) \
    $(wildcard include/config/ioctl/hex2str/error.h) \
    $(wildcard include/config/feature/editing.h) \
    $(wildcard include/config/feature/editing/history.h) \
    $(wildcard include/config/feature/editing/savehistory.h) \
    $(wildcard include/config/feature/tab/completion.h) \
    $(wildcard include/config/feature/username/completion.h) \
    $(wildcard include/config/feature/editing/vi.h) \
    $(wildcard include/config/feature/editing/save/on/exit.h) \
    $(wildcard include/config/pmap.h) \
    $(wildcard include/config/feature/show/threads.h) \
    $(wildcard include/config/feature/ps/additional/columns.h) \
    $(wildcard include/config/feature/topmem.h) \
    $(wildcard include/config/feature/top/smp/process.h) \
    $(wildcard include/config/killall.h) \
    $(wildcard include/config/pgrep.h) \
    $(wildcard include/config/pkill.h) \
    $(wildcard include/config/pidof.h) \
    $(wildcard include/config/sestatus.h) \
    $(wildcard include/config/unicode/support.h) \
    $(wildcard include/config/feature/mtab/support.h) \
    $(wildcard include/config/feature/clean/up.h) \
    $(wildcard include/config/feature/devfs.h) \
  include/platform.h \
    $(wildcard include/config/werror.h) \
    $(wildcard include/config/big/endian.h) \
    $(wildcard include/config/little/endian.h) \
    $(wildcard include/config/nommu.h) \
  /usr/lib/gcc/i686-linux-gnu/4.6/include-fixed/limits.h \
  /usr/lib/gcc/i686-linux-gnu/4.6/include-fixed/syslimits.h \
  /usr/include/limits.h \
  /usr/include/features.h \
  /usr/include/i386-linux-gnu/bits/predefs.h \
  /usr/include/i386-linux-gnu/sys/cdefs.h \
  /usr/include/i386-linux-gnu/bits/wordsize.h \
  /usr/include/i386-linux-gnu/gnu/stubs.h \
  /usr/include/i386-linux-gnu/gnu/stubs-32.h \
  /usr/include/i386-linux-gnu/bits/posix1_lim.h \
  /usr/include/i386-linux-gnu/bits/local_lim.h \
  /usr/include/linux/limits.h \
  /usr/include/i386-linux-gnu/bits/posix2_lim.h \
  /usr/include/i386-linux-gnu/bits/xopen_lim.h \
  /usr/include/i386-linux-gnu/bits/stdio_lim.h \
  /usr/include/byteswap.h \
  /usr/include/i386-linux-gnu/bits/byteswap.h \
  /usr/include/endian.h \
  /usr/include/i386-linux-gnu/bits/endian.h \
  /usr/lib/gcc/i686-linux-gnu/4.6/include/stdint.h \
  /usr/include/stdint.h \
  /usr/include/i386-linux-gnu/bits/wchar.h \
  /usr/lib/gcc/i686-linux-gnu/4.6/include/stdbool.h \
  /usr/include/unistd.h \
  /usr/include/i386-linux-gnu/bits/posix_opt.h \
  /usr/include/i386-linux-gnu/bits/environments.h \
  /usr/include/i386-linux-gnu/bits/types.h \
  /usr/include/i386-linux-gnu/bits/typesizes.h \
  /usr/lib/gcc/i686-linux-gnu/4.6/include/stddef.h \
  /usr/include/i386-linux-gnu/bits/confname.h \
  /usr/include/getopt.h \
  /usr/include/i386-linux-gnu/bits/unistd.h \
  /usr/include/ctype.h \
  /usr/include/xlocale.h \
  /usr/include/dirent.h \
  /usr/include/i386-linux-gnu/bits/dirent.h \
  /usr/include/errno.h \
  /usr/include/i386-linux-gnu/bits/errno.h \
  /usr/include/linux/errno.h \
  /usr/include/i386-linux-gnu/asm/errno.h \
  /usr/include/asm-generic/errno.h \
  /usr/include/asm-generic/errno-base.h \
  /usr/include/fcntl.h \
  /usr/include/i386-linux-gnu/bits/fcntl.h \
  /usr/include/i386-linux-gnu/sys/types.h \
  /usr/include/time.h \
  /usr/include/i386-linux-gnu/sys/select.h \
  /usr/include/i386-linux-gnu/bits/select.h \
  /usr/include/i386-linux-gnu/bits/sigset.h \
  /usr/include/i386-linux-gnu/bits/time.h \
  /usr/include/i386-linux-gnu/bits/select2.h \
  /usr/include/i386-linux-gnu/sys/sysmacros.h \
  /usr/include/i386-linux-gnu/bits/pthreadtypes.h \
  /usr/include/i386-linux-gnu/bits/uio.h \
  /usr/include/i386-linux-gnu/bits/stat.h \
  /usr/include/i386-linux-gnu/bits/fcntl2.h \
  /usr/include/inttypes.h \
  /usr/include/netdb.h \
  /usr/include/netinet/in.h \
  /usr/include/i386-linux-gnu/sys/socket.h \
  /usr/include/i386-linux-gnu/sys/uio.h \
  /usr/include/i386-linux-gnu/bits/socket.h \
  /usr/include/i386-linux-gnu/bits/sockaddr.h \
  /usr/include/i386-linux-gnu/asm/socket.h \
  /usr/include/asm-generic/socket.h \
  /usr/include/i386-linux-gnu/asm/sockios.h \
  /usr/include/asm-generic/sockios.h \
  /usr/include/i386-linux-gnu/bits/socket2.h \
  /usr/include/i386-linux-gnu/bits/in.h \
  /usr/include/rpc/netdb.h \
  /usr/include/i386-linux-gnu/bits/siginfo.h \
  /usr/include/i386-linux-gnu/bits/netdb.h \
  /usr/include/setjmp.h \
  /usr/include/i386-linux-gnu/bits/setjmp.h \
  /usr/include/i386-linux-gnu/bits/setjmp2.h \
  /usr/include/signal.h \
  /usr/include/i386-linux-gnu/bits/signum.h \
  /usr/include/i386-linux-gnu/bits/sigaction.h \
  /usr/include/i386-linux-gnu/bits/sigcontext.h \
  /usr/include/i386-linux-gnu/asm/sigcontext.h \
  /usr/include/linux/types.h \
  /usr/include/i386-linux-gnu/asm/types.h \
  /usr/include/asm-generic/types.h \
  /usr/include/asm-generic/int-ll64.h \
  /usr/include/i386-linux-gnu/asm/bitsperlong.h \
  /usr/include/asm-generic/bitsperlong.h \
    $(wildcard include/config/64bit.h) \
  /usr/include/linux/posix_types.h \
  /usr/include/linux/stddef.h \
  /usr/include/i386-linux-gnu/asm/posix_types.h \
  /usr/include/i386-linux-gnu/asm/posix_types_32.h \
  /usr/include/asm-generic/posix_types.h \
  /usr/include/i386-linux-gnu/bits/sigstack.h \
  /usr/include/i386-linux-gnu/sys/ucontext.h \
  /usr/include/i386-linux-gnu/bits/sigthread.h \
  /usr/include/stdio.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/lib/gcc/i686-linux-gnu/4.6/include/stdarg.h \
  /usr/include/i386-linux-gnu/bits/sys_errlist.h \
  /usr/include/i386-linux-gnu/bits/stdio2.h \
  /usr/include/stdlib.h \
  /usr/include/i386-linux-gnu/bits/waitflags.h \
  /usr/include/i386-linux-gnu/bits/waitstatus.h \
  /usr/include/alloca.h \
  /usr/include/i386-linux-gnu/bits/stdlib.h \
  /usr/include/string.h \
  /usr/include/i386-linux-gnu/bits/string3.h \
  /usr/include/libgen.h \
  /usr/include/poll.h \
  /usr/include/i386-linux-gnu/sys/poll.h \
  /usr/include/i386-linux-gnu/bits/poll.h \
  /usr/include/i386-linux-gnu/sys/ioctl.h \
  /usr/include/i386-linux-gnu/bits/ioctls.h \
  /usr/include/i386-linux-gnu/asm/ioctls.h \
  /usr/include/asm-generic/ioctls.h \
  /usr/include/linux/ioctl.h \
  /usr/include/i386-linux-gnu/asm/ioctl.h \
  /usr/include/asm-generic/ioctl.h \
  /usr/include/i386-linux-gnu/bits/ioctl-types.h \
  /usr/include/i386-linux-gnu/sys/ttydefaults.h \
  /usr/include/i386-linux-gnu/sys/mman.h \
  /usr/include/i386-linux-gnu/bits/mman.h \
  /usr/include/i386-linux-gnu/sys/stat.h \
  /usr/include/i386-linux-gnu/sys/time.h \
  /usr/include/i386-linux-gnu/sys/wait.h \
  /usr/include/i386-linux-gnu/sys/resource.h \
  /usr/include/i386-linux-gnu/bits/resource.h \
  /usr/include/termios.h \
  /usr/include/i386-linux-gnu/bits/termios.h \
  /usr/include/i386-linux-gnu/bits/timex.h \
  /usr/include/i386-linux-gnu/sys/param.h \
  /usr/include/linux/param.h \
  /usr/include/i386-linux-gnu/asm/param.h \
  /usr/include/asm-generic/param.h \
  /usr/include/pwd.h \
  /usr/include/grp.h \
  /usr/include/mntent.h \
  /usr/include/paths.h \
  /usr/include/i386-linux-gnu/sys/statfs.h \
  /usr/include/i386-linux-gnu/bits/statfs.h \
  /usr/include/utmp.h \
  /usr/include/i386-linux-gnu/bits/utmp.h \
  /usr/include/arpa/inet.h \
  include/xatonum.h \
  /usr/include/i386-linux-gnu/sys/utsname.h \
  /usr/include/i386-linux-gnu/bits/utsname.h \

libbb/login.o: $(deps_libbb/login.o)

$(deps_libbb/login.o):
