section .text

callNumberPrint:
    mov rbx,0
InverseAndPrint:
    mov rdx,0
    mov rcx,10
    idiv rcx;divi
    push rdx
    inc rbx
    cmp rax,0
    jle printNumber 
    jmp InverseAndPrint
printDebug : 
    mov rsi,debug;message write
    mov rdi,1;file to write 
    push rax
    mov rax,1;id of the syscall 1 for write
    syscall
    pop rax
    ret


printNumber:
    pop rdx
    add rdx,'0'
    mov [letter],rdx
    mov rsi,letter;message write
    mov rdx,1
    mov rdi,1;file to write 
    mov rax,1;id of the syscall 1 for write
    syscall
    dec rbx
    cmp rbx,0
    jg printNumber 
    ret
