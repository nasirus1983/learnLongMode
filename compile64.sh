#!/bin/bash

rm -r -f build
mkdir build

nasm -f elf64 bootloader/loader.asm -o build/loader.o
nasm -f elf64 bootloader/boot.asm -o build/boot.o
nasm -f elf64 bootloader/long_mode_start.asm -o build/mode64.o

g++ -m64 -c os/kernel.c -o build/kernel.o
# g++ -m64 -c os/tools.h -o build/tools_h.o
g++ -m64 -c os/tools.c -o build/tools.o

ld -n -o build/kernel.bin \
    -T bootloader/linker.ld \
    build/loader.o \
    build/boot.o \
    build/mode64.o \
    build/kernel.o \
    build/tools.o \

mkdir build/isofiles
mkdir build/isofiles/boot
mkdir build/isofiles/boot/grub/

cp config/grub.cfg build/isofiles/boot/grub/
cp build/kernel.bin build/isofiles/boot/

grub-mkrescue -o build/os.iso build/isofiles