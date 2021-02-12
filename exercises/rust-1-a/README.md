# Readme

## Instructions

Your task is to find the longest contiguous subslice of a slice of integers for which each member is 1 higher than its predecessor. For example, given the slice `[1, 2, 4, 4, 5, 6, 7, 3, 2, 7, 8, 9, 1]`, the longest subslice where each member is 1 higher than its predecessor is `[4, 5, 6, 7]`, from indices `3` through `6` inclusive.

We provide a function stub:

```rust
pub fn longest_incrementing_subslice(s: &[u8]) -> &[u8]
```

Note the signature: you should return a subsection of the input slice, not a newly-allocated vector.

It is safe to assume that every input contains exactly one longest subslice.

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using the [`dbg!` macro](https://doc.rust-lang.org/std/macro.dbg.html) or [`println!` macro](https://doc.rust-lang.org/std/macro.println.html):

```rust
dbg!("Debug message");
println!("Debug message");
```
