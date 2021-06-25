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
