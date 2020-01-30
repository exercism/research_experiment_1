## Introduction

This is Part 1 of our research into how people write Ruby differently. This exercise should take 10-15 minutes for a programmer who is proficient in Ruby. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to determine which word in a sentence has the most vowels (a, e, i, o, u). A sentence is defined as a [Ruby string][docs-string] consisting of one or more words. A word consists of one or more upper- or lowercase letters. Words are separated from each other by a single space character.

Your job is to define a method with the signature `word_with_most_vowels`, which takes a sentence, and returns the word with the most vowels.

For example:

```ruby
word_with_most_vowels("Hi there aunt jeanie")
// Returns: "jeanie"
```

[docs-string]: https://ruby-doc.org/core-2.4.1/String.html

**Note:** You can use `debug("some test")` to output debugging information for yourself.
