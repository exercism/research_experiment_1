## Introduction

This is Part 1 of our research into how people write x86-64 assembly differently. This exercise should take 10-15 minutes for a programmer who is proficient in x86-64 assembly. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your job is to define a function with the signature `color_name`, which takes an enum value, and returns the name of the constant in the enumeration that has the specified value.

For example:

```c
color_name(RED);
// Returns: "RED"
```

The enum is declared as follows:

```c
enum color {
    RED,
    ORANGE,
    YELLOW,
    GREEN,
    BLUE,
    INDIGO,
    VIOLET
};
```

The enum value is passed into the function via the `rdi` register, and the return value should be stored in the `rax` register.

## Troubleshooting

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. By including the file "debug.asm" using the [%include](https://www.nasm.us/xdoc/2.14.02/html/nasmdoc4.html#section-4.6.1) directive, you gain access to some useful macros:

`debugd8`, `debugd16`, `debugd32`, `debugd64`: Print a signed integer. The argument can be a register or a memory location with width of 8, 16, 32, or 64 bits respectively.

`debugu8`, `debugu16`, `debugu32`, `debugu64`: Print an unsigned integer. The argument can be a register or a memory location with width of 8, 16, 32, or 64 bits respectively.

`debugx8`, `debugx16`, `debugx32`, `debugx64`: Print a hexadecimal integer. The argument can be a register or a memory location with width of 8, 16, 32, or 64 bits respectively.

`debugf`: Print a floating-point number. The argument can be an `xmm` register or a memory location.

`debugc`: Print a single character. The argument can be a register or a memory location with width of 8 bits.

`debugs`: Print a character string. The argument can be a register or a memory location with width of 64 bits.

Example usage:

```nasm
debugd8 al
debugu16 cx
debugx32 edx
debugf xmm0
debugc byte [rdi]
debugs rsi
```
