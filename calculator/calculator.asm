;nasm -f elf32 calculator.asm -o calculator.o && ld -m elf_i386 calculator.o -o calculator && ./calculator && echo $?


;TODO: do a calculator that does additon subtraction multiplication and divison 3 inputs
section .data
    msg db "Calculator:", 10
    len equ $ - msg
    first_input db 100



section .text
    global _start

_start:

    mov edx, len        ; Dsplay "Calculator:""
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov ebx, 2          ; getting input from user
    mov eax, 3
    mov cx, first_input
    mov dx, 100
    int 0x80

    mov ebx, 1      ; print the 1st input
    mov eax, 4
    int 0x80

    mov ebx, 0
    mov eax, 1
    int 0x80