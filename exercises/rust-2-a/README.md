# Readme

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

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using the [`dbg!` macro](https://doc.rust-lang.org/std/macro.dbg.html) or [`println!` macro](https://doc.rust-lang.org/std/macro.println.html):

```rust
dbg!("Debug message");
println!("Debug message");
```
