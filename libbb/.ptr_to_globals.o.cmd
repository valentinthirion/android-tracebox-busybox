cmd_libbb/ptr_to_globals.o := /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/arm-none-linux-gnueabi-gcc -Wp,-MD,libbb/.ptr_to_globals.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.22.1)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -Os     -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(ptr_to_globals)"  -D"KBUILD_MODNAME=KBUILD_STR(ptr_to_globals)" -c -o libbb/ptr_to_globals.o libbb/ptr_to_globals.c

deps_libbb/ptr_to_globals.o := \
  libbb/ptr_to_globals.c \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/errno.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/features.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/predefs.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/sys/cdefs.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/wordsize.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/gnu/stubs.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/bits/errno.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/linux/errno.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm/errno.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm-generic/errno.h \
  /home/valentin/Desktop/android_busybox_compiler/arm-2010q1/bin/../arm-none-linux-gnueabi/libc/usr/include/asm-generic/errno-base.h \

libbb/ptr_to_globals.o: $(deps_libbb/ptr_to_globals.o)

$(deps_libbb/ptr_to_globals.o):
