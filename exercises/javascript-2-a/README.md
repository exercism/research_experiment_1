## Introduction

This is Part 2 of our research into how people write JavaScript differently. This exercise should take 10-15 minutes for a programmer who is proficient in JavaScript. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

You're a magician and you handle a deck of cards. You can already _move_ a card from one position to another position within a deck. In order to correctly execute your magic trick, you need to be able to perform a _sequence_ of moves. You already have two functions named `arrange` and `rearrange` which perform a single move, in _either direction_.

Your task is to extend the existing code with new functionality to perform a sequence of moves. The new implementation should:

- execute a single move when given `from` and `to` as numbers.
- execute a sequence of moves when given an array of number pairs.

Extend function `arrange` that takes:

- an `array` (of length `n`) of items,
- a `from` position (whole `number`, `-n <= from < n`),
- and `to` position (whole `number`, `-n <= to < n`)

so that it can also take

- an `array` (of length `n`) of items,
- an `array` of position (whole `number`, `-n <= from < n`) pairs in the form `[from, to]`,

As in the existing code, positive numbers mean that you move cards from the bottom of the deck (the left hand side) and negative numbers refer to starting at the top of the deck (the right hand side).

It returns a _new array_ with the `item` moved from the position `from` to the position `to`:

```javascript
const before = ["❤ A", "❤ 9", "❤ 3", "❤ 6", "♣ A"];
const magics = arrange(original, [[1, -2]]);
magics;
// => ['❤ A', '❤ 3', '❤ 6', '❤ 9', '♣ A']
//                          ^--- has moved from position 1 to -2 (from the right side)
```

Extend the second function `rearrange` to do the same thing, but **mutate** the original input `array`:

```javascript
const before = ["❤ A", "❤ 3", "❤ 6", "❤ 9", "♣ A"];
const magics = rearrange(before, [[4, 0]]);
magics;
// => ['♣ A', '❤ A', '❤ 3', '❤ 6', '❤ 9']
//      ^--- has moved from position 4 to 0
magics === before;
// => true
```
