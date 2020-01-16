extern isalpha
extern isalnum

section .text
global str_isidentifier
str_isidentifier:
    push rbx
    mov rbx, rdi
    movzx edi, byte [rbx]
    call isalpha wrt ..plt
    test eax, eax
    jne .loop_start
    cmp byte [rbx], '_'
    jne .return_false
    add rbx, 1
.loop_start:
    movzx edi, byte [rbx]
    call isalnum wrt ..plt
    test eax, eax
    jne .next_char
    cmp byte [rbx], '_'
    jne .return_false
.next_char:
    add rbx, 1
    cmp byte [rbx], 0
    jne .loop_start
    mov eax, 1
    pop rbx
    ret
.return_false:
    xor eax, eax
    pop rbx
    ret
