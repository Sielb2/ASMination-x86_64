#!/bin/bash
nasm -f elf64 asmination.asm -o asmination.o
ld asmination.o -o asmination
echo "run animation with ./asmination"
