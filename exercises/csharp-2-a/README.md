## Introduction

This is Part 2 of our research into how people write C# differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to extend existing code with new functionality. The code you'll be working with has a method named `Sentence.WordWithMostVowels`. This method takes a sentence and returns the word that has the most vowels (a, e, i, o, u). A sentence is defined as a [C# string][docs-string] consisting of one or more words. A word consists of one or more upper- or lowercase letters. Words are separated from each other by a single space character.

For example:

```csharp
Sentence.WordWithMostVowels("Hi there aunt jeanie")
// Returns: "jeanie"
```

Your job is to extend this code to deal with tiebreaks - the situation where there are multiple words with the same number of vowels. In these cases the word with the most consecutive consonants (non-vowel letters) should be returned.

For example:

```csharp
Sentence.WordWithMostVowels("his own hints")
// Returns: "hints"
```

All three words have the same (maximum) number of vowels. The most consecutive consonants for `"his"` is 1, `"own` has 2 and `"hints"` has 3. Therefore, `"hints"` is the word that should be returned.

Your task is to add this functionality to the `Sentence.WordWithMostVowels` method.

[docs-string]: https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/strings/
