## Introduction

This is Part 1 of our research into how people write x86-64 assembly differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to determine if all characters in a string are alphabetic, i.e., either an uppercase letter, or a lowercase letter.

Your job is to define a function with the signature `str_isalpha`, which takes a pointer to a null-terminated byte string, and returns a non-zero value if all characters in the string are alphabetic and there is at least one character, zero otherwise.

For example:

```c
str_isalpha("Hello");
// Returns: non-zero
```

The string is passed in the `rdi` register, and the return value in `rax`.
