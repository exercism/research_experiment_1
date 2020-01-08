## Introduction

This is Part 2 of our research into how people write Elm differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to extend existing code with new functionality. The code you'll be working with has a function named `aggregateScorers`. This function takes a list of scorers for a football game, and aggregates any duplicates.

For example:

```elm
aggregateScorers [ "Lisa", "Anna", "Lisa" ]
-- Returns: [ "Anna", "Lisa (2)" ]
```

Your job is to extend this code to include the time that goals were scored. The way that scorers are recorded now includes the minute that the goal was scored. The required aggregated format has also changed, and now the time of each goal should be displayed in brackets after the name, instead of the number of goals. The list should continue to be ordered alphabetically.

For example:

```elm
aggregateScorers [ "Lisa 21", "Anna 34", "Lisa 76" ]
-- Returns: [ "Anna (34)", "Lisa (21, 76)" ]
```

Your task is to modify the `aggregateScorers` function to support this new format.

## Elm Documentation

In order to save time googling, some links to the elm documentation are here. This is designed to be a failry exhaustive list, as opposed to a list of things that any one solution will need

- [Debug](https://package.elm-lang.org/packages/elm/core/latest/Debug)
- [List](https://package.elm-lang.org/packages/elm/core/latest/List)
- [Dict](https://package.elm-lang.org/packages/elm/core/latest/Dict)
- [Set](https://package.elm-lang.org/packages/elm/core/latest/Set)
- [Array](https://package.elm-lang.org/packages/elm/core/latest/Array)
- [Maybe](https://package.elm-lang.org/packages/elm/core/latest/Maybe)
- [String](https://package.elm-lang.org/packages/elm/core/latest/String)
- [Tuple](https://package.elm-lang.org/packages/elm/core/latest/Tuple)
- [Parser](https://package.elm-lang.org/packages/elm/parser/latest)
- [Regular Expressions](9https://package.elm-lang.org/packages/elm/regex/latest/)
- [Conditionals](https://elm-lang.org/docs/syntax#conditionals)
- [Type Alias'](https://elm-lang.org/docs/syntax#type-aliases)