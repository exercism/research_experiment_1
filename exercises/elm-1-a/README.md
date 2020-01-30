## Introduction

This is Part 1 of our research into how people write Elm differently. This exercise should take 10-15 minutes for a programmer who is proficient in Elm. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to take a list of scorers for a football game, and aggregate any duplicates. 

Your job is to implement the `aggregateScorers` function which takes a `List String` (the names of the players that scored the goals, that can contain duplicate player names), and returns an aggregated `List String`, where each player only appears once, and where the number of goals that a player has scored is included in brackets after their name if they have scored multiple goals. This aggregated list should be ordered alphabetically.

For example:

```elm
aggregateScorers ["Lisa", "Anna", "Lisa"]
-- Returns: [ "Anna", "Lisa (2)" ]
```
 
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
- [Regular Expressions](9https://package.elm-lang.org/packages/elm/regex/latest/)
- [Conditionals](https://elm-lang.org/docs/syntax#conditionals)
- [Type Alias'](https://elm-lang.org/docs/syntax#type-aliases)
