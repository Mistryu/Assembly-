;nasm -f elf32 tutorial.asm -o tutorial.o && ld -m elf_i386 tutorial.o -o tutorial && ./tutorial && echo $?


section .text
global _start

_start:
    eax 0
    cpuid 
    eax, ebx, ecx   