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
    cmp esi, 0
    je .label_red
    cmp esi, 1
    je .label_orange
    cmp esi, 2
    je .label_yellow
    cmp esi, 3
    je .label_green
    cmp esi, 4
    je .label_blue
    cmp esi, 5
    je .label_indigo
    lea rsi, [rel violet]
    jmp .strcpy
.label_red:
    lea rsi, [rel red]
    jmp .strcpy
.label_orange:
    lea rsi, [rel orange]
    jmp .strcpy
.label_yellow:
    lea rsi, [rel yellow]
    jmp .strcpy
.label_green:
    lea rsi, [rel green]
    jmp .strcpy
.label_blue:
    lea rsi, [rel blue]
    jmp .strcpy
.label_indigo:
    lea rsi, [rel indigo]
.strcpy:
    movzx edx, byte [rsi]
    mov byte [rdi], dl
    add rsi, 1
    add rdi, 1
    cmp byte [rsi], 0
    jne .strcpy
    mov byte [rdi], 0
    ret
