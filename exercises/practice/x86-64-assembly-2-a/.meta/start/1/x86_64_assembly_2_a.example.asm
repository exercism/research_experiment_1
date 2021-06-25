section .text
global str_isidentifier
str_isidentifier:
    mov eax, 1
    movzx ecx, byte [rdi]
    or ecx, 32
    sub ecx, 'a'
    cmp ecx, 26
    jb .loop_start
    cmp byte [rdi], '_'
    jne .return_false
    add rdi, 1
.loop_start:
    movzx ecx, byte [rdi]
    or ecx, 32
    sub ecx, 'a'
    cmp ecx, 26
    jb .next_char
    movzx ecx, byte [rdi]
    sub ecx, '0'
    cmp ecx, 10
    jb .next_char
    cmp byte [rdi], '_'
    jne .return_false
.next_char:
    add rdi, 1
    cmp byte [rdi], 0
    jne .loop_start
    ret
.return_false:
    xor eax, eax
    ret
