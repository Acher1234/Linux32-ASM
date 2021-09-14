global _start

_start:
    
_print:
    mov eax, 17
    mov edx,eax
    mov ecx,sen
    mov ebx,1
    mov eax,4
    int 0x80


section .data
    sen DB "sentence to screen \0"

