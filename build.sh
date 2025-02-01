#!/bin/bash
echo -e "\e[32minstalling packages...\e[0m"
sudo apt update && sudo apt install nasm binutils -y
nasm -f elf64 asmination.asm -o asmination.o
ld asmination.o -o asmination
echo -e "\e[35m play animation with ./asmination\e[0m"
