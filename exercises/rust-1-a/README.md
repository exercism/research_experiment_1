## Introduction

This is Part 1 of our research into how people write Rust in varying styles. This exercise should take 10-15 minutes for a programmer who is proficient in Rust. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't look for a complete solution to the problem as this will negatively affect the research.

## Instructions

Your task is to find the longest incrementing subslice of a slice of integers. For example, given the slice `[1, 2, 4, 4, 5, 6, 7, 3, 2, 7, 8, 9, 1]`, the longest incrementing subslice is `[4, 5, 6, 7]`, from indices `3` through `6` inclusive.

We provide a function stub:

```rust
pub fn longest_incrementing_subslice(s: &[u8]) -> &[u8]
```

Note the signature: you should return a subsection of the input slice, not a newly-allocated vector.

It is safe to assume that every input contains exactly one longest subslice.

## Troubleshooting

When a test fails, a message is displaying what went wrong and for which input. Also, anything written to standard out is captured and will be displayed for failing tests as well. For passing tests, this data is suppressed for concision.

For debugging, the [`dbg!` macro](https://doc.rust-lang.org/std/macro.dbg.html) is the most useful way to report internal status information to standard out, but you can also use the [`println!` macro](https://doc.rust-lang.org/std/macro.println.html) to report arbitrary formatted data.
