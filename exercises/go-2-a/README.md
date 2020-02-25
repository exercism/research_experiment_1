## Introduction

This is Part 2 of our research into differences in the ways in which people write Go. This exercise should take 10-15 minutes for a programmer who is proficient in Go. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

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

Describe(52)
// Returns: "2 score or 3 dozen or 52"

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

## Troubleshooting

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any console output will be shown too. You can write to the console using:

```go
fmt.Println("Debug message");
```
