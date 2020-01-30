## Introduction

This is Part 1 of our research into how people write Go differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

You're working as a [blackjack][wikipedia.org-blackjack] dealer at a casino. Blackjack is a card game that uses a regular [deck of cards][wikipedia.org-playing_card], where each card is assigned a value. The numerical cards' values are simply their numeric values. The Jack, Queen and King are worth `10`, and an Ace can be worth either `1` or `11`. A hand's score is defined as the sum of the values of its cards.

The casino uses the following, simplified rules to determine if a player wins:

- The player's score is higher than the dealer's score while not exceeding 21; or
- The dealer's score exceeds 21.

To further simplify things, the casino has decided that an Ace will always be worth `11`.

Your task is to define a function named `PlayerWins`, which takes a player- and dealer hand, and returns `true` if the player wins, and `false` if the dealer wins. The hands are passed as strings, where each character in the string represents a single card. The characters '2' to '9' are worth their numeric value; 'X' (representing the `10` card), 'J', 'Q' and 'K' are worth `10` and 'A' is worth `11`.

For example:

```go
PlayerWins("A9", "J8")
// Returns: true

PlayerWins("54X", "KQ")
// Returns: false
```

## Troubleshooting

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using:

```go
fmt.Println("Debug message");
```

[wikipedia.org-blackjack]: https://en.wikipedia.org/wiki/Blackjack
[wikipedia.org-playing_card]: https://en.wikipedia.org/wiki/Playing_card
