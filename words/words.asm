;nasm -f elf32 words.asm -o words.o; ld -m elf_i386 words.o -o words; ./words; echo $?

global _start

section .data
    addr db "yellow"

section .text

_start:
    mov [addr], byte "H"   ;this changes the string at the begining 
    mov [addr + 5], byte "!"    ; change string at value 5 (0 + 5)
    mov eax, 4  ; sys_write system call 
    mov ebx,1   ;stdout file descriptor
    mov ecx, addr   ;bytes to write 
    mov edx, 6  ;bumber of bytes to write
    int 0x80

    mov eax, 1  ;sys_exit system call
    mov ebx, 0  ;exit status is 0 - everything is fine that's the 0 at the end
    int 0x80


; db means 1 byte
; name1 db "string"  - we store a string
; name2 db 0xff - we store a value in Hex
; name3 db 100 - we store value 100
; dw is 2 bytes
; name4 dw 1000
; dd is 4 bytes
; name5 dd 100000