## Introduction

This is Part 1 of our research into how people write x86-64 assembly differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

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
