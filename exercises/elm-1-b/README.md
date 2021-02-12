# Instructions

You are the proud owner of an amazing pizzeria but your website is missing the menu.
So you scanned a printed menu and the scanner was able to extract the text in the image.
Unfortunately it is all one big block of text like follows:

```elm
"formaggio (v) 8€, regina 11€, ..."
```

Each pizza entry has three components: its name, an optional vegetarian indicator, and its price. The pizzas themselves are separated by a comma followed by a space.

Your job is to implement the `retrieveMenu` function which takes a `string` (the scanned menu), and returns a `List Pizza` (the `Pizza` type is already provided for convenience).

For example:

```elm
retrieveMenu "formaggio (v) 8€"
-- Returns: [ Pizza "formaggio" True 8 ]
```
