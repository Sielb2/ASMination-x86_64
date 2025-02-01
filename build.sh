#!/bin/bash
echo "installing..."
sudo apt update && sudo apt install nasm binutils -y
echo "building animation..."
nasm -f elf64 asmination.asm -o asmination.o
ld asmination.o -o asmination
echo "run animation with ./asmination !"
