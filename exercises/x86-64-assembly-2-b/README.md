## Instructions

Your task is to extend existing code with new functionality. The code you'll be working with has a function named `color_name`. This function takes an enum value, and returns the name of the constant in the enumeration that has the specified value.

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

Your job is to modify the `color_name` function to take a user-provided buffer in addition to the enum value. Instead of returning the name of the constant in the enumeration, it should be copied into the buffer.

For example:

```c
char buf[BUFSIZE];

color_name(buf, RED);
// buf contains "RED"
```

The user-provided buffer is passed into the function via the `rdi` register, and the enum value is passed into the function via the `rsi` register.

## Debugging

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
