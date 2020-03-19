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
