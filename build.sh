#!/bin/bash
echo -e "\e[32minstalling packages...\e[0m"
sudo apt update && sudo apt install nasm binutils -y
echo -e "\e[32mbuilding animation...\e[0m"
nasm -f elf64 asmination.asm -o asmination.o
ld asmination.o -o asmination
echo -e "\e[32m play animation with ./asmination !\e[0m"
