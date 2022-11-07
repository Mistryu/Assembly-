;   nasm -f elf32 Hello_world.asm -o Hello_world.o && ld -m elf_i386 Hello_world.o -o Hello_world && ./Hello_world

section .text
    global _start


_start:
    mov eax, 4  ;sys_write system call
    mov ebx, 1  ;stdout file descripter
    mov ecx, msg  ; bytes to write
    mov edx, len  ; number of bytes to write
    int 0x80  ; perform system call 

    
    mov eax, 1 ; sys_exit system call
    mov ebx, 0  ;exit status is 0 means successful
    int 0x80 


section .data
    msg db "Hello, world", 0x0a
    len equ $ - msg
