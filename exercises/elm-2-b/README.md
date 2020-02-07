## Introduction

This is Part 1 of our research into how people write Elm differently.
This exercise should take 10-15 minutes for a programmer who is proficient in Elm.
There is no right or wrong way to approach it - just do what feels the most natural to you.
Feel free to use books, Google or Stack Overflow,
just like you would if you were programming normally,
but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Well done on the printed menu analysis!
It was only the flyer version of the menu however.
Let's now parse the full size version, which also contains ingredients!
They are listed as follows.

```elm
scannedMenu = "formaggio (v), tomato sauce, emmental, 8€, regina, tomato sauce, ham, mushrooms, cantal, 11€, ..."
```

**Your task is still to convert this string into a list of pizzas.**
The `Pizza` type is already provided for convenience,
and has been updated to contain a list of ingredients.
