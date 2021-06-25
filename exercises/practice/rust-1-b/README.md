## Instructions

Your task is to remove all vowels from a string. This technique, called _disemvowelment_, is often employed to reduce the effectiveness of troll messages in online fora; it is an intermediate step of lesser consequence than removing the message outright.

We provide a stub method with this signature:

```rust
pub fn disemvowel(s: &str) -> String
```

Note: in Rust, regular expressions are implemented in an [external crate](https://crates.io/crates/regex), and are thus not part of the standard library. As such, they are not available for this exercise.

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using the [`dbg!` macro](https://doc.rust-lang.org/std/macro.dbg.html) or [`println!` macro](https://doc.rust-lang.org/std/macro.println.html):

```rust
dbg!("Debug message");
println!("Debug message");
```
