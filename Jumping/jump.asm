;  nasm -f elf32 jump.asm -o jump.o && ld -m elf_i386 jump.o -o jump && ./jump && echo $?


global _start

; simple jump
; section .text
; _start:
;     mov ebx, 42  ; exit status is 42
;     mov eax, 1  ; sys_exit system call
;     jmp skip  ; jump to "skip" label
;     mov ebx, 10 ; exit status is 10

; skip:
;     int 0x80


;jump with compare
; section .text
; _start:
;     mov ecx, 101  ;set ecx to 99 or 101 it will check whether < than 100
;     mov ebx, 42  ;exit status is 42
;     mov eax, 1  ; sys_exit system call
;     cmp ecx, 100  ; compare ecx to 100
;     jl skip  ;  jump if less than 
;     mov ebx, 1  ;exit status is 13

; skip:
;     int 0x80


;proper loop
section .text
_start:
mov ebx, 1    ; start ebx at 1
mov ecx, 2    ; number of iterations

label:
    add ebx, ebx  ; ebx += ebx
    dec ecx       ; ecx -= 1
    cmp ecx, 0    ; compare ecx with 0
    jg label      ; jump to label if greater
    mov eax, 1    ; sys_exit system call
    int 0x80