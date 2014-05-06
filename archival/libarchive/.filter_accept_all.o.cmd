cmd_archival/libarchive/filter_accept_all.o := /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/arm-none-linux-gnueabi-gcc -Wp,-MD,archival/libarchive/.filter_accept_all.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.22.1)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -Os     -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(filter_accept_all)"  -D"KBUILD_MODNAME=KBUILD_STR(filter_accept_all)" -c -o archival/libarchive/filter_accept_all.o archival/libarchive/filter_accept_all.c

deps_archival/libarchive/filter_accept_all.o := \
  archival/libarchive/filter_accept_all.c \
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
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/include-fixed/limits.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/include-fixed/syslimits.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/limits.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/features.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/predefs.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/cdefs.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/wordsize.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/gnu/stubs.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/posix1_lim.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/local_lim.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/linux/limits.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/posix2_lim.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/xopen_lim.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/stdio_lim.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/byteswap.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/byteswap.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/endian.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/endian.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/stdint.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/wchar.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/include/stdbool.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/unistd.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/posix_opt.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/environments.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/types.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/typesizes.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/include/stddef.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/confname.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/getopt.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/ctype.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/xlocale.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/dirent.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/dirent.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/errno.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/errno.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/linux/errno.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm/errno.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm-generic/errno.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm-generic/errno-base.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/fcntl.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/fcntl.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/types.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/time.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/select.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/select.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/sigset.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/time.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/sysmacros.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/pthreadtypes.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/uio.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/stat.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/stat.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/inttypes.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/netdb.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/netinet/in.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/socket.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/uio.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/socket.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/sockaddr.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm/socket.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm/sockios.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/in.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/rpc/netdb.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/siginfo.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/netdb.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/setjmp.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/setjmp.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/signal.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/signum.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/sigaction.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/sigcontext.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm/sigcontext.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/sigstack.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/ucontext.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/procfs.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/time.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/user.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/sigthread.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/stdio.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/libio.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/_G_config.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/wchar.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/include/stdarg.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/sys_errlist.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/stdlib.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/waitflags.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/waitstatus.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/alloca.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/string.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/libgen.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/poll.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/poll.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/poll.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/ioctl.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/ioctls.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm/ioctls.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm/ioctl.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm-generic/ioctl.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/ioctl-types.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/ttydefaults.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/mman.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/mman.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/wait.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/resource.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/resource.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/termios.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/termios.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/param.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/linux/param.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm/param.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/pwd.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/grp.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/mntent.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/paths.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/statfs.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/statfs.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/utmp.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/utmp.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/arpa/inet.h \
  include/xatonum.h \
  include/bb_archive.h \
    $(wildcard include/config/feature/tar/uname/gname.h) \
    $(wildcard include/config/tar.h) \
    $(wildcard include/config/dpkg.h) \
    $(wildcard include/config/dpkg/deb.h) \
    $(wildcard include/config/feature/tar/gnu/extensions.h) \
    $(wildcard include/config/feature/tar/to/command.h) \
    $(wildcard include/config/feature/tar/selinux.h) \
    $(wildcard include/config/cpio.h) \
    $(wildcard include/config/rpm2cpio.h) \
    $(wildcard include/config/rpm.h) \
    $(wildcard include/config/feature/ar/create.h) \

archival/libarchive/filter_accept_all.o: $(deps_archival/libarchive/filter_accept_all.o)

$(deps_archival/libarchive/filter_accept_all.o):
