#!/bin/bash

swig -perl5 key_utils.i
gcc -c `perl -MConfig -e 'print join(" ", @Config{qw(ccflags optimize cccdlflags)}, "-I$Config{archlib}/CORE")'` -lssl -lcrypto key_utils.c key_utils_wrap.c
perl Makefile.PL
make
make install

#gcc `perl -MConfig -e 'print $Config{lddlflags}'` -lssl -lcrypto key_utils.o key_utils_wrap.o -o key_utils.so


#swig -perl -static -lperlmain.i key_utils.i
#gcc -c `perl -MConfig -e 'print join(" ", @Config{qw(ccflags optimize cccdlflags)}, "-I$Config{archlib}/CORE")'` -lssl -lcrypto key_utils.c key_utils_wrap.c
#clang key_utils.o key_utils_wrap.o -L/usr/lib/perl5/5.00503/i386-linux/CORE -lssl -lcrypto -lnsl -lm -o myperl
