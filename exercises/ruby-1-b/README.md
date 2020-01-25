## Introduction

This is Part 1 of our research into how people write Ruby differently.
This exercise should take 10-15 minutes. There is no right or wrong way
to approach it - just do what feels the most natural to you. Feel free
to use books, Google or Stack Overflow, just like you would if you were
programming normally, but please don't actively look for a solution to
the problem as this will negatively affect the research.

## Instructions

You are given a collection of library books, and your job is to import them into
the library's catalog system. The books are in a text file which provides a title,
ISBN, author, and publishing year for each book.

Write the methods that will import the data for the books from the text file to
the library's catalog system.

The data is stored in plain text in a file called `books.txt`. One record for each line,
and the `;` character is used as a delimiter. The first two lines look like this:

```
Title;ISBN;Author;Published
The Adventures of Tom Sawyer;9780191604928;Mark Twain;2007
```

**Note:** You can use `debug("some test")` to output debugging information for yourself.
