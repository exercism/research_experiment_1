## Introduction

This is Part 2 of our research into differences in the ways in which people write Rust. This exercise should take 10-15 minutes for a programmer who is proficient in Rust. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't look for a complete solution to the problem as this will negatively affect the research.

## Instructions

Your task is to extend existing code with new functionality. The code you'll be working with has a function named `longest_incrementing_subslice`, which finds the longest contiguous subslice of an input slice for which each member is 1 higher than its predecessor:

```rust
pub fn longest_incrementing_subslice(s: &[u8]) -> &[u8]
```

You need to write a new function, `longest_increasing_subslices`, which differs from `longest_incrementing_subslice` in two ways:

- Increasing subslices are still contiguous, but members may be any positive amount higher than their predecessor, not just 1
- There may be any number of increasing subslices present in the input; you must output all of the longest.

```rust
pub fn longest_increasing_subslices<'a>(s: &'a [u8]) -> Vec<&'a [u8]>
```

For example:

```rust
assert_eq!(
    longest_increasing_subslices(&[5, 2, 3, 4, 4, 1, 3, 5, 0, 1]),
    &[&[2, 3, 4], &[1, 3, 5]],
);
```

## Notes

If there are no increasing subslices, return an empty vector.

The return vector must be sorted according to the initial index of the returned slices.

As before, you must return subslices of the initial slice, not copy the data.

You may do whatever you wish with the existing `longest_incrementing_subslice` implementation: modify it, call it, ignore it; there are no restrictions, it is provided only for inspiration.

## Troubleshooting

When a test fails, a message is displaying what went wrong and for which input. Also, anything written to standard out is captured and will be displayed for failing tests as well. For passing tests, this data is suppressed for concision.

For debugging, the [`dbg!` macro](https://doc.rust-lang.org/std/macro.dbg.html) is the most useful way to report internal status information to standard out, but you can also use the [`println!` macro](https://doc.rust-lang.org/std/macro.println.html) to report arbitrary formatted data.
