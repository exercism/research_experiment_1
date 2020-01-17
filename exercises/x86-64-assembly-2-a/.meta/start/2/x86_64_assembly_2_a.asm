%include "debug.asm"

extern isalpha

section .text
global str_isalpha
str_isalpha:
    push rbx
    mov rbx, rdi
.loop_start:
    movzx edi, byte [rbx]
    call isalpha wrt ..plt
    test eax, eax
    je .loop_end
    add rbx, 1
    cmp byte [rbx], 0
    jne .loop_start
.loop_end:
    pop rbx
    ret
