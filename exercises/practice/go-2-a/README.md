## Instructions

Your task is to extend existing code with new functionality. The code you'll be working with has a function named `Describe`, which takes a number and returns the possible descriptions of that number as a string. Besides the obvious literal representation of a number (`1` being written as `"1"`), the following units are also supported:

- `144` is a `"gross"`
- `20` is a `"score"`
- `12` is a `"dozen"`

If the number can be written as a multiple of one of these units, the description includes a description of the number as said unit, in descending order of unit size. It is possible for a number to match multiple units or none.

For example:

```go
Describe(12)
// Returns: "1 dozen or 12"

Describe(60)
// Returns: "3 score or 5 dozen or 60"

Describe(5)
// Returns: "5"
```

Your job is to change the `Describe` function to no longer return the possible descriptions, but to describe the number as a combination of the available units (with a possible remainder), preferring larger units over smaller units.

For example:

```go
Describe(12)
// Returns: "1 dozen"

Describe(52)
// Returns: "2 score and 1 dozen"

Describe(193)
// Returns: "1 gross, 2 score and 9"

Describe(5)
// Returns: "5"
```

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using:

```go
fmt.Println("Debug message");
```
