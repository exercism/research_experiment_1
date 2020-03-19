## Introduction

This is Part 1 of our research into differences in the ways in which people write C#. This exercise should take 10-15 minutes for a programmer who is proficient in C#. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to determine which word in a sentence has the most vowels (a, e, i, o, u). A sentence is defined as a [C# string][docs-string] consisting of one or more words. A word consists of one or more upper- or lowercase letters. Words are separated from each other by a single space character.

Your job is to define a method named `Sentence.WordWithMostVowels`, which takes a sentence, and returns the word with the most vowels.

For example:

```csharp
Sentence.WordWithMostVowels("Hi there aunt jeanie")
// Returns: "jeanie"
```

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any [console output][programiz.com-basic-input-output] will be shown too. You can write to the console using:

```csharp
Console.WriteLine("Debug message");
```

[docs-string]: https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/strings/
[programiz.com-basic-input-output]: https://www.programiz.com/csharp-programming/basic-input-output
