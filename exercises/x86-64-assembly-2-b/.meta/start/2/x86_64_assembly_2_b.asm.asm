%include "debug.asm"

section .rodata
red: db "RED", 0
orange: db "ORANGE", 0
yellow: db "YELLOW", 0
green: db "GREEN", 0
blue: db "BLUE", 0
indigo: db "INDIGO", 0
violet: db "VIOLET", 0

array: dq red, orange, yellow, green, blue, indigo, violet

section .text
global color_name
color_name:
    mov edi, edi
    lea rax, [rel array]
    mov rax, [rax + rdi * 8]
    ret
