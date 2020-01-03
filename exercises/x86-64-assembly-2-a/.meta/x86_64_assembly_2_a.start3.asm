%include "debug.asm"

section .data
CHAR_UPPER: equ 0x0001
CHAR_LOWER: equ 0x0002

info_table:
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , 0         , 0         , 0
db 0         , CHAR_UPPER, CHAR_UPPER, CHAR_UPPER
db CHAR_UPPER, CHAR_UPPER, CHAR_UPPER, CHAR_UPPER
db CHAR_UPPER, CHAR_UPPER, CHAR_UPPER, CHAR_UPPER
db CHAR_UPPER, CHAR_UPPER, CHAR_UPPER, CHAR_UPPER
db CHAR_UPPER, CHAR_UPPER, CHAR_UPPER, CHAR_UPPER
db CHAR_UPPER, CHAR_UPPER, CHAR_UPPER, CHAR_UPPER
db CHAR_UPPER, CHAR_UPPER, CHAR_UPPER, 0
db 0         , 0         , 0         , 0
db 0         , CHAR_LOWER, CHAR_LOWER, CHAR_LOWER
db CHAR_LOWER, CHAR_LOWER, CHAR_LOWER, CHAR_LOWER
db CHAR_LOWER, CHAR_LOWER, CHAR_LOWER, CHAR_LOWER
db CHAR_LOWER, CHAR_LOWER, CHAR_LOWER, CHAR_LOWER
db CHAR_LOWER, CHAR_LOWER, CHAR_LOWER, CHAR_LOWER
db CHAR_LOWER, CHAR_LOWER, CHAR_LOWER, CHAR_LOWER
db CHAR_LOWER, CHAR_LOWER, CHAR_LOWER, 0
db 0         , 0         , 0         , 0

section .text
global str_isalpha
str_isalpha:
    mov eax, 1
    lea rcx, [rel info_table]
.loop_start:
    movzx edx, byte [rdi]
    test byte [rcx + rdx], CHAR_UPPER|CHAR_LOWER
    je .return_false
    add rdi, 1
    cmp byte [rdi], 0
    jne .loop_start
    ret
.return_false:
    xor eax, eax
    ret
