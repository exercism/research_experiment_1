## Introduction

This is Part 2 of our research into how people write Rust in varying styles. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't look for a complete solution to the problem as this will negatively affect the research.

## Instructions

Your task is to find the moment when a clock's hands are perfectly aligned for a given hour. However, you will be using nonstandard clocks. You may have seen [24-hour clocks](https://i.pinimg.com/originals/d0/0c/c2/d00cc2c17993ca8e1faf603fbd308d27.png) in the past; in this portion of the exercise, you will solve for those and [others](https://en.wikipedia.org/wiki/Clock_of_the_Long_Now).

We provide structs as follows:

```rust
pub struct Hand {
    pub name: &'static str, // for human-readable documentation only
    pub qty: u32,           // how many intervals appear on the clock face
    pub seconds: u32,       // how many seconds are in this period of time
}

pub struct Clock {
    pub big: Hand,
    pub little: Hand, 
}
```

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

We provide the shell of a method with the signature

```rust
fn hands_match(clock: &Clock, big_hand: u32) -> u64
```

The output must be the number of seconds after the previous big hand interval at which the hands line up.

For example:

```rust
// on a standard clock, the clock's hands align at noon and midnight precisely
assert_eq!(hands_match(&STANDARD, 12), 0);
```

