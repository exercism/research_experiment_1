## Introduction

This is Part 1 of our research into how people write C# differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to determine which word in a sentence has the most vowels (a, e, i, o, u). A sentence is defined as a [C# string][docs-string] consisting of one or more words. A word consists of one or more upper- or lowercase letters. Words are separated from each other by a single space character.

Your task is to define a method with the signature `Sentence.WordWithMostVowels`, which takes a sentence, and returns the word with the most vowels.

For example:

```csharp
Sentence.WordWithMostVowels("Hi there aunt jeanie")
// Returns: "jeanie"
```

[docs-string]: https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/strings/
