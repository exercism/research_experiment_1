%include "debug.asm"

section .text
global str_isalpha
str_isalpha:
    mov eax, 1
.loop_start:
    movzx ecx, byte [rdi]
    or ecx, 32
    sub ecx, 'a'
    cmp ecx, 26
    jae .return_false
    add rdi, 1
    cmp byte [rdi], 0
    jne .loop_start
    ret
.return_false:
    xor eax, eax
    ret
