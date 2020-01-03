## Introduction

This is Part 1 of our research into how people write Go differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to define a function with the signature `Describe`, which takes a number and returns the possible descriptions of that number as a string. Besides the obvious literal representation of a number (`1` being written as `"1"`), the following units are also supported:

- `144` is a `"gross"`
- `20` is a `"score"`
- `12` is a `"dozen"`

If the number can be written as a multiple of one of these units, the description should include a description of the number as said unit. It is possible for a number to match multiple units or none.

For example:

```go
Describe(12)
// Returns: "1 dozen or 12"

Describe(52)
// Returns: "2 score or 3 dozen or 52"

Describe(5)
// Returns: "5"
```

## Troubleshooting

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using:

```go
fmt.Println("Debug message");
```
