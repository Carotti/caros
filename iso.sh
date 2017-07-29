#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/caros.kernel isodir/boot/caros.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "caros" {
	multiboot /boot/caros.kernel
}
EOF
grub-mkrescue -o caros.iso isodir
