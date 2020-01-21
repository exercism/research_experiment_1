## Introduction

This is Part 1 of our research into how people write Rust in varying styles. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't look for a complete solution to the problem as this will negatively affect the research.

## Instructions

Your task is to remove all vowels from a string. This technique, called _disemvowelment_, is often employed to reduce the effectiveness of troll messages in online fora; it is an intermediate step of lesser consequence than removing the message outright. 

We provide a stub with this signature:

```rust
pub fn disemvowel(s: &str) -> String
```

Note: in Rust, regular expressions are implemented in an [external crate](https://crates.io/crates/regex), and are thus not part of the standard library. As such, they are not available for this exercise.
