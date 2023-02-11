section .text
global _start

_start:
    mov rax,25025
    mov rbx,0
    call InverseAndPrint
    mov rax,60
    syscall
;compte:
;     mov rax,0
;     mov rbx,sen
;     loop:
;         push rax 
;         call printNumber
;         pop rax 
;         push rbx
;         push rax
;         call printDebug 
;         call printSaut
;         pop rax
;         pop rbx 
;         mov rdx,[rbx + rax]
;         inc rax
;         cmp rax,10
;         jne loop
; print: 
;     mov rdx,rax
;     mov rsi,sen;message write
;     mov rdi,1;file to write 
;     mov rax,1;id of the syscall 1 for write
;     syscall
;     call printSaut
;     mov rax,60
;     syscall


printDebug : 
    mov rdx,2
    mov rsi,debug;message write
    mov rdi,1;file to write 
    mov rax,1;id of the syscall 1 for write
    syscall
    ret
printSaut : 
    mov rdx,1
    mov rsi,char;message write
    mov rdi,1;file to write 
    mov rax,1;id of the syscall 1 for write
    syscall
    ret
InverseAndPrint:
    mov rcx,10
    idiv rcx
    add rbx,rdx
    cmp rax,0
    jle beforePrint 
    push rax
    mov rax,rbx 
    mov rbx,10
    imul rbx
    mov rbx,rax
    pop rax
    jmp InverseAndPrint
beforePrint:
    mov rax,rbx
printNumber:
    mov rdx,0
    mov rcx,10
    idiv rcx
    add rdx,'0'
    mov [letter],rdx
    mov rsi,letter;message write
    mov rdx,1
    mov rdi,1;file to write 
    push rax
    mov rax,1;id of the syscall 1 for write
    syscall
    pop rax
    cmp rax,0
    jg printNumber 
    ret

section .data
    sen DB "ssssssentence to screen",0
    debug DB "OK"
    char DB 10
    number DB "123456789123456789123456789"
section .bss
    letter RESW 1