section .data
    msg db 'Hello, World!', 0

section .text
    global _start

_start:
    ; Escreve a string na saída padrão (stdout)
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 13
    int 0x80

    ; Termina o programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

