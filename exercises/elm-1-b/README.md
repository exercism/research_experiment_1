## Introduction

This is Part 1 of our research into how people write Elm differently. This exercise should take 10-15 minutes for a programmer who is proficient in Elm. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

You are the proud owner of an amazing pizzeria but your website is missing the menu.
So you scanned a printed menu and the scanner was able to extract the text in the image.
Unfortunately it is all one big block of text like follows:

```elm
scannedMenu = "formaggio (v) 8€, regina 11€, ..."
```

At least it follows a useful patern.
There is the name, an indication if it is vegetarian, and the price.
**Your task is to convert this string into a list of pizzas.**
The `Pizza` type is already provided for convenience.
