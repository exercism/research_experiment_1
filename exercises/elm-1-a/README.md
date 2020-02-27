## Introduction

This is Part 1 of our research into differences in the ways in which people write Elm. This exercise should take 10-15 minutes for a programmer who is proficient in Elm. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to take a list of scorers for a football game, and aggregate any duplicates.

Your job is to implement the `aggregateScorers` function which takes a `List String` (the names of the players that scored the goals, that can contain duplicate player names), and returns an aggregated `List String`, where each player only appears once, and where the number of goals that a player has scored is included in brackets after their name if they have scored multiple goals. This aggregated list should be ordered alphabetically.

For example:

```elm
aggregateScorers ["Lisa", "Anna", "Lisa"]
-- Returns: [ "Anna", "Lisa (2)" ]
```
