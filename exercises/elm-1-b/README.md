## Introduction

This is Part 1 of our research into how people write Elm differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

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

## Elm Documentation

In order to save time googling, some links to the Elm documentation are here. This is designed to be a fairly exhaustive list, as opposed to a list of things that any one solution will need

- [Debug](https://package.elm-lang.org/packages/elm/core/latest/Debug)
- [List](https://package.elm-lang.org/packages/elm/core/latest/List)
- [Dict](https://package.elm-lang.org/packages/elm/core/latest/Dict)
- [Set](https://package.elm-lang.org/packages/elm/core/latest/Set)
- [Array](https://package.elm-lang.org/packages/elm/core/latest/Array)
- [Maybe](https://package.elm-lang.org/packages/elm/core/latest/Maybe)
- [String](https://package.elm-lang.org/packages/elm/core/latest/String)
- [Tuple](https://package.elm-lang.org/packages/elm/core/latest/Tuple)
- [Parser](https://package.elm-lang.org/packages/elm/parser/latest)
- [Regular Expressions](https://package.elm-lang.org/packages/elm/regex/latest/)
- [Conditionals](https://elm-lang.org/docs/syntax#conditionals)
- [Type Alias'](https://elm-lang.org/docs/syntax#type-aliases)
