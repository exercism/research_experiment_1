# Instructions

You're a magician and you handle a deck of cards. In order to correctly execute your magic trick, you need to be able to _move_ a card from one position to another position. That is, you need to be able to `rearrange` the deck. Naturally, you want to be able to move cards in _both directions_, and be able to say "from the top of the deck" or "from the bottom of the deck".

Create a function `arrange` that takes:

- an `array` (of length `n`) of items,
- a `from` position (whole `number`, `-n <= from < n`),
- and `to` position (whole `number`, `-n <= to < n`)

Positive numbers means that you move cards from the bottom of the deck (the left hand side) and negative numbers refer to starting at the top of the deck (the right hand side).

It returns a _new array_ with the `item` moved from the position `from` to the position `to`:

```javascript
const before = ['❤ A', '❤ 9', '❤ 3', '❤ 6', '♣ A']
const magics = arrange(before, 1, -2)
magics
// => ['❤ A', '❤ 3', '❤ 6', '❤ 9', '♣ A']
//                          ^--- has moved from position 1 to -2 (from the right side)
```
Create a second function `rearrange` that does the same thing, but **mutates** the original input `array`:

```javascript
const before = ['❤ A', '❤ 3', '❤ 6', '❤ 9', '♣ A']
const magics = rearrange(before, 4, 0)
magics
// => ['♣ A', '❤ A', '❤ 3', '❤ 6', '❤ 9']
//      ^--- has moved from position 4 to 0
magics === before
// => true
```
