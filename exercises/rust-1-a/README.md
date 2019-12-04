## Introduction

This is Part 1 of our research into how people write Rust in varying styles. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't look for a complete solution to the problem as this will negatively affect the research.

## Instructions

Your task is to find the moment when a clock's hands are perfectly aligned for a given hour. Given a standard 12-hour clock with hands which sweep continuously through time, there exists some second in each hour in which the hands are best lined up with each other. 

We provide a method with the signature:

```rust
fn hands_match(hour: u8) -> u32
```

The range of possible values for `hour` is 1-12. The output must be the number of seconds after the hour at which the hands best line up.

For example:

```rust
// the clock's hands align at noon and midnight precisely
assert_eq!(hands_match(12), 0);
```
