## Introduction

This is Part 2 of our research into how people write Elm differently.
This exercise should take 10-15 minutes for a programmer who is proficient in Elm.
There is no right or wrong way to approach it - just do what feels the most natural to you.
Feel free to use books, Google or Stack Overflow,
just like you would if you were programming normally,
but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to extend existing code with new functionality.
The provided starting code is able to parse pizzas name,
vegetarian hint (v) and price for a string such as:

```elm
scannedMenu = "formaggio (v) 8€, regina 11€, ..."
```

Now we also need to parse ingredients! They are listed as follows,
between pizzas name and the price.
Note that ingredients are separated by commas.

```elm
scannedMenu = "formaggio (v), tomato sauce, emmental, 8€, regina, tomato sauce, ham, mushrooms, cantal, 11€, ..."
```

**Your task is still to convert this string into a list of pizzas.**
The `Pizza` type is already provided for convenience,
and has been updated to contain a list of ingredients.
