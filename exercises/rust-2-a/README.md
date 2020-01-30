## Introduction

This is Part 2 of our research into how people write Rust in varying styles. This exercise should take 10-15 minutes for a programmer who is proficient in Rust. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't look for a complete solution to the problem as this will negatively affect the research.

## Instructions

Your task is to extend existing code with new functionality. The code you'll be working with has a function named `hands_match`, which finds the moment when a clock's hands are perfectly aligned for a given hour, on a standard, 12-hour clock. 

```rust
fn hands_match(clock: &Clock, big_hand: u32) -> u64
```

You need to extend this function so it computes the correct results on nonstandard clocks. You may have seen [24-hour clocks](https://i.pinimg.com/originals/d0/0c/c2/d00cc2c17993ca8e1faf603fbd308d27.png) in the past; in this portion of the exercise, you will solve for those and [others](https://en.wikipedia.org/wiki/Clock_of_the_Long_Now).

A standard 12-hour clock is constructed like this:

```rust
const STANDARD: Clock = Clock {
    big: Hand {
        name: "hour",
        qty: 12,
        seconds: 3600,
    },
    little: Hand {
        name: "minute",
        qty: 60,
        seconds: 60,
    },
}
```
The output must be the number of seconds after the previous big hand interval at which the hands line up.

For example:

```rust
// on a standard clock, the clock's hands align at noon and midnight precisely
assert_eq!(hands_match(&STANDARD, 12), 0);
```

It is safe to assume that `clock.little.seconds` is a multiple of `clock.big.seconds`.

## Troubleshooting

When a test fails, a message is displaying what went wrong and for which input. Also, anything written to standard out is captured and will be displayed for failing tests as well. For passing tests, this data is suppressed for concision.

For debugging, the [`dbg!` macro](https://doc.rust-lang.org/std/macro.dbg.html) is the most useful way to report internal status information to standard out, but you can also use the [`println!` macro](https://doc.rust-lang.org/std/macro.println.html) to report arbitrary formatted data.
