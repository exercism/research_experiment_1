section .rodata
red: db "RED", 0
orange: db "ORANGE", 0
yellow: db "YELLOW", 0
green: db "GREEN", 0
blue: db "BLUE", 0
indigo: db "INDIGO", 0
violet: db "VIOLET", 0

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
    mov edi, edi
    lea rdx, [rel jump_table]
    movsx rax, dword [rdx + rdi * 4]
    add rax, rdx
    jmp rax
label_red:
    lea rax, [rel red]
    ret
label_orange:
    lea rax, [rel orange]
    ret
label_yellow:
    lea rax, [rel yellow]
    ret
label_green:
    lea rax, [rel green]
    ret
label_blue:
    lea rax, [rel blue]
    ret
label_indigo:
    lea rax, [rel indigo]
    ret
label_violet:
    lea rax, [rel violet]
    ret
