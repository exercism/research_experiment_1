## Introduction

This is Part 2 of our research into how people write x86-64 assembly differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

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

The user-provided buffer is passed in the `rdi` register, and the enum value in the `rsi` register.
