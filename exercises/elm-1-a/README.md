## Introduction

This is Part 1 of our research into how people write Elm differently. This exercise should take 10-15 minutes. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to take a list of scorers for a football game, and aggregate any duplicates. The aggregated list should represent each scorer once with the number of goals after their name in brackets, if they have scored multiple goals.

The aggregated list should maintain the original list order, based on the first occurence of a scorer.

For example, if the initial list of scorers is

["Lisa", "Anna", "Lisa"]

Then the aggregated list should look like this. Lisa is first in the list, as her name appeared first in the original list.

[ "Lisa (2)", "Cedd" ] 
