section .rodata
red: db "RED", 0
red_len: equ $ - red
orange: db "ORANGE", 0
orange_len: equ $ - orange
yellow: db "YELLOW", 0
yellow_len: equ $ - yellow
green: db "GREEN", 0
green_len: equ $ - green
blue: db "BLUE", 0
blue_len: equ $ - blue
indigo: db "INDIGO", 0
indigo_len: equ $ - indigo
violet: db "VIOLET", 0
violet_len: equ $ - violet

; Use relative displacements to avoid fixups
jump_table:
dd label_red - jump_table
dd label_orange - jump_table
dd label_yellow - jump_table
dd label_green - jump_table
dd label_blue - jump_table
dd label_indigo - jump_table
dd label_violet - jump_table

section .text
global color_name
color_name:
    mov esi, esi
    lea rdx, [rel jump_table]
    movsx rax, dword [rdx + rsi * 4]
    add rax, rdx
    jmp rax
label_red:
    lea rsi, [rel red]
    mov ecx, red_len
    jmp strcpy
label_orange:
    lea rsi, [rel orange]
    mov ecx, orange_len
    jmp strcpy
label_yellow:
    lea rsi, [rel yellow]
    mov ecx, yellow_len
    jmp strcpy
label_green:
    lea rsi, [rel green]
    mov ecx, green_len
    jmp strcpy
label_blue:
    lea rsi, [rel blue]
    mov ecx, blue_len
    jmp strcpy
label_indigo:
    lea rsi, [rel indigo]
    mov ecx, indigo_len
    jmp strcpy
label_violet:
    lea rsi, [rel violet]
    mov ecx, violet_len
    jmp strcpy
strcpy:
    rep movsb
    ret
