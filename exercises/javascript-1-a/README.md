## Introduction

This is Part 1 of our research into how people write JavaScript differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

You're a magician and you handle a deck of cards. In order to correctly execute your magic trick, you need to be able to _move_ a card from one position to another position. That is, you need to be able to `rearrange` the deck. Naturally, you want to be able to move in _both directions_, as well as use a negative numbers for the `from` and `to` values (so you can say "from the top" or "from the bottom" -- it's all about the magic ✨)`.

Create a function `rearrange` that takes an `array` (of length `n`) of items, a `from` position (whole `number`, `-n <= from < n`), and `to` position (whole `number`, `-n <= to < n`) that moves the item from the position `from` to the position `to`:

```javascript
const before = ['❤ A', '❤ 3', '❤ 6', '❤ 9', '♣ A']
const magics = rearrange(before, 4, 0)

magics
// => ['♣ A', '❤ A', '❤ 3', '❤ 6', '❤ 9']
//      ^--- has moved from position 4 to 0

magics === before
// => true
```

Create a second function `arrange` that does the same thing, but does _not_ mutate the original input `array`:

```javascript
const before = ['🍒', '🍋', '🍎', '🍊', '🍐']
const magics = arrange(original, 1, -2)

magics
// => ['🍒', '🍎', '🍊', '🍋','🍐']
//                          ^--- has moved from position 1 to -2 (from the right side)

magics === before
// => false
```
