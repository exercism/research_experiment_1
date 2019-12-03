## Introduction

This is Part 1 of our research into how people write Haskell differently. This exercise should take at most 15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to determine which word in a sentence has the most vowels (a, e, i, o, u).

We expect you to define a function `wordWithMostVowels :: String -> String` which takes a sentence and returns a word. A sentence is defined as a sequence of letters separated by whitespace.

For example:

```haskell
> wordWithMostVowels "hi there aunt jeanie"
"jeanie"
```
