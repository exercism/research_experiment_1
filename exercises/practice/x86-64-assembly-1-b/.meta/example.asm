section .rodata
red: db "RED", 0
orange: db "ORANGE", 0
yellow: db "YELLOW", 0
green: db "GREEN", 0
blue: db "BLUE", 0
indigo: db "INDIGO", 0
violet: db "VIOLET", 0

section .text
global color_name
color_name:
    cmp edi, 0
    je .label_red
    cmp edi, 1
    je .label_orange
    cmp edi, 2
    je .label_yellow
    cmp edi, 3
    je .label_green
    cmp edi, 4
    je .label_blue
    cmp edi, 5
    je .label_indigo
    lea rax, [rel violet]
    ret
.label_red:
    lea rax, [rel red]
    ret
.label_orange:
    lea rax, [rel orange]
    ret
.label_yellow:
    lea rax, [rel yellow]
    ret
.label_green:
    lea rax, [rel green]
    ret
.label_blue:
    lea rax, [rel blue]
    ret
.label_indigo:
    lea rax, [rel indigo]
    ret
