# Readme

## Instructions

Your task is to extend existing code with new functionality. The existing code represents a [blackjack][wikipedia.org-blackjack] dealer at a casino. Blackjack is a card game that uses a regular [deck of cards][wikipedia.org-playing_card], where each card is assigned a value. The numerical cards' values are simply their numeric values. The Jack, Queen and King are worth `10`, and an Ace can be worth either `1` or `11`. A hand's score is defined as the sum of the values of its cards.

The code you'll be working with has a function named `PlayerWins`, which takes a player- and dealer hand, and returns `true` if the player wins, and `false` if the dealer wins. The hands are passed as strings, where each character in the string represents a single card. The characters '2' to '9' are worth their numeric value; 'X' (representing the `10` card), 'J', 'Q' and 'K' are worth `10` and 'A' is worth `1` or `11`.

Currently, the casino uses the following, simplified rules to determine if a player wins:

- The player's score is higher than the dealer's score while not exceeding 21; or
- The dealer's score exceeds 21.

To further simplify things, the casino decided that an Ace was always worth `11`.

For example:

```go
PlayerWins("A9", "J8")
// Returns: true

PlayerWins("54X", "KQ")
// Returns: false
```

The casino has decided to drop the simplified rules and use the normal rules instead. This changes two things:

- An Ace can now be worth either `1` or `11`; and
- If the player's first two cards have a score of `21`, the player always wins unless the dealer's first two cards also have a score of `21`.

Your job is to change the `PlayerWins` function to use the normal rules, instead of the simplified rules.

For example:

```go
PlayerWins("AK", "J92")
// Returns: true

PlayerWins("89A", "X7")
// Returns: true
```

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using:

```go
fmt.Println("Debug message");
```

[wikipedia.org-blackjack]: https://en.wikipedia.org/wiki/Blackjack
[wikipedia.org-playing_card]: https://en.wikipedia.org/wiki/Playing_card
