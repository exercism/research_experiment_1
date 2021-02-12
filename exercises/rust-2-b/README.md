# Readme

## Instructions

Your task is to extend existing code with new functionality. The code you'll be working with has a function named `disemvowel`, which removes all vowels from a string.

```rust
pub fn disemvowel(s: &str) -> String
```

You need to extend this function so in addition to removing the vowels, it replaces certain letters with digits and other characters to further obfuscate the message, according to this table:

| Letter | Replacement |
| ------ | ----------- |
| b      | 8           |
| c      | (           |
| g      | 9           |
| l      | 1           |
| s      | 5           |
| t      | +           |
| v      | ^           |

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using the [`dbg!` macro](https://doc.rust-lang.org/std/macro.dbg.html) or [`println!` macro](https://doc.rust-lang.org/std/macro.println.html):

```rust
dbg!("Debug message");
println!("Debug message");
```
