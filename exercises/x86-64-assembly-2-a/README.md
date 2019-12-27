## Introduction

This is Part 2 of our research into how people write x86-64 assembly differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to extend existing code with new functionality. The code you'll be working with has a function named `str_isalpha`. This function takes a pointer to a null-terminated byte string, and returns a non-zero value if all characters in the string are alphabetic and there is at least one character, zero otherwise.

For example:

```c
str_isalpha("Hello");
// Returns: non-zero
```

Your job is to extend this code to determine if a string is a valid identifier in the C programming language. The rules for naming identifiers are:

- An identifier can only have alphanumeric characters, i.e., uppercase letters, lowercase letters, or digits.
- The first character must be alphabetic, or an underscore.

Rename the function to `str_isidentifier`. The function should take a pointer to a null-terminated byte string, and return a non-zero value if the string is a valid C identifier, zero otherwise.

For example:

```c
str_isidentifier("my_variable1");
// Returns: non-zero
```

The string is passed into the function via the `rdi` register, and the return value should be stored in the `rax` register.
