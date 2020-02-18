## Introduction

This is Part 1 of our research into how people write Ruby differently. This exercise should take 10-15 minutes for a programmer who is proficient in Ruby. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

You are given a collection of library books, and your job is to import them into
the library's catalog system. The books are in the constant `Library::BOOKS`, and
each book has the following columns:
title, ISBN, author, and publishing year.

You need to write the logic for finding a book, adding new copies to the library's
inventory, lending a book, and returning a book.

A book should be findable with it's ISBN
```
book = Library.new.find("9780191604928")
```
And it should have getters for the book's attributes:
```
book.author
=> "Mark Twain"

book.title
// Returns: "The Adventures of Tom Sawyer"

# and so on ...
```

**Note:** You can use `debug("some test")` to output debugging information for yourself.
