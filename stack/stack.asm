; nasm -f elf32 stack.asm -o stack.o && ld -m elf_i386 stack.o -o stack && ./stack && echo $?

global _start 


_start:
    sub esp, 4      ;stack goes from 28 -> 0 and it does it by 4 so 28 -> 24 ->20
    mov [esp], byte "H"   ;esp is a pointer to the stack here we assighn values to different stack values
    mov [esp+1], byte "e"
    mov  [esp+2], byte "y"
    mov [esp+3], byte "!"
    
    mov eax, 4   ;sys_write system call
    mov ebx, 1   ;stdout file descriptor
    mov ecx, esp ; pointer to bytes to write
    mov edx, 4   ; number of bytes to write
    int 0x80     ;perform sys call

    mov eax, 1  ;sys_exit system call
    mov ebx, 0  ; exit status is 0
    int 0x80