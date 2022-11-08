;nasm -f elf32 words.asm -o words.o && ld -m elf_i386 words.o -o words && ./words && echo $?

; change y to H before printing 
; section .text
;     global _start

; _start:
;     mov [addr], byte "H"   ;this changes the string at the begining 
;     mov [addr + 5], byte "!"    ; change string at value 5 (0 + 5)
;     mov eax, 4  ; sys_write system call 
;     mov ebx,1   ;stdout file descriptor
;     mov ecx, addr   ;bytes to write 
;     mov edx, 6  ;bumber of bytes to write
;     int 0x80

;     mov eax, 1  ;sys_exit system call
;     mov ebx, 0  ;exit status is 0 - everything is fine that's the 0 at the end
;     int 0x80

; section .data
;     addr db "yellow"


; print starts 9 times

section .text
global _start

_start:nasm -f elf32 calculator.asm -o calculator.o && ld -m elf_i386 calculator.o -o calculator && ./calculator; echo $?
    mov edx, len
    mov ecx, msg
    mov ebx, 1  ;stdout file descriptor
    mov eax, 4  ; sys_write system call 
    int 0x80

    mov edx, 9
    mov ecx, s2
    mov ebx, 1
    mov eax, 4
    int 0x80

    mov eax, 1
    mov ebx, 0 
    int 0x80



section .data
    msg db "Displaying 9 stars", 10
    len equ $ - msg 
    s2 times 9 db "*"


; db means 1 byte - define byte
; name1 db "string"  - we store a string
; name2 db 0xff - we store a value in Hex
; name3 db 100 - we store value 100
; dw is 2 bytes - define world
; name4 dw 1000
; dd is 4 bytes - define double
; name5 dd 100000