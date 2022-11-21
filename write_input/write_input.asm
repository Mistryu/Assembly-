;nasm -f elf32 write_input.asm -o write_input.o && ld -m elf_i386 write_input.o -o write_input && ./write_input && echo $?


; section .data                           ;Data segment
;    userMsg db 'Please enter a number: ' ;Ask the user to enter a number
;    lenUserMsg equ $-userMsg             ;The length of the message
;    dispMsg db 'You have entered: '
;    lenDispMsg equ $-dispMsg                 

; section .bss           ;Uninitialized data
;    num resb 5
	
; section .text          ;Code Segment
;    global _start
	
; _start:                ;User prompt
;    mov eax, 4
;    mov ebx, 1
;    mov ecx, userMsg
;    mov edx, lenUserMsg
;    int 80h

;    ;Read and store the user input
;    mov eax, 3
;    mov ebx, 0
;    mov ecx, num        ; we store value from ecx to num -> input is stored in num variable  
;    mov edx, 5          ;5 bytes (numeric, 1 for sign) of that information
;    int 80h
	
;    ;Output the message 'The entered number is: '
;    mov eax, 4
;    mov ebx, 1
;    mov ecx, dispMsg
;    mov edx, lenDispMsg
;    int 80h  

;    ;Output the number entered
;    mov eax, 4
;    mov ebx, 1
;    mov ecx, num
;    mov edx, 5
;    int 80h  
    
;    ; Exit code
;    mov eax, 1
;    mov ebx, 0
;    int 80h



section	.text
   global _start     ;must be declared for linker (ld)
_start:             ;tell linker entry point
	
   ;writing the name 'Zara Ali'
   mov	edx,9       ;message length
   mov	ecx, name   ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   mov	[name],  dword 'Nuha'    ; Changed the name to Nuha Ali
	
   ;writing the name 'Nuha Ali'
   mov	edx,9       ;message length
   mov	ecx,name    ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
name db 'Zara Ali', 0x0a