## Introduction

This is Part 2 of our research into differences in the ways in which people write Elm.
This exercise should take 10-15 minutes for a programmer who is proficient in Elm.
There is no right or wrong way to approach it - just do what feels the most natural to you.
Feel free to use books, Google or Stack Overflow,
just like you would if you were programming normally,
but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to extend existing code with new functionality.
The existing code deals wth parsing a scanned menu of a pizzeria, which contains a list of all the pizzas on the menu. Each pizza entry has three components: its name, an optional vegetarian indicator, and its price. The pizzas themselves are separated by a comma followed by a space.

The code you'll be working with has a function named `retrieveMenu`, which takes the scanned menu as a `string`, and returns a `List Pizza`:

For example:

```elm
retrieveMenu "formaggio (v) 8€"
-- Returns: [ Pizza "formaggio" True 8 ]
```

Now we also need to parse ingredients! They are listed as follows,
between a pizza's name and its price.
Note that ingredients are separated by commas.

```elm
"formaggio (v), tomato sauce, emmental, 8€, regina, tomato sauce, ham, mushrooms, cantal, 11€, ..."
```

Your job is to update the `retrieveMenu` function to also parse the pizza's ingredients.

For example:

```elm
retrieveMenu "formaggio (v), tomato sauce, emmental, 8€, regina, tomato sauce, ham, mushrooms, cantal, 11€"
-- Returns: [ Pizza "formaggio" True ["tomato sauce", "emmental"] 8 ]
```
