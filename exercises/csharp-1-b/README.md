## Introduction

This is Part 1 of our research into differences in the ways in which people write C#. This exercise should take 10-15 minutes for a programmer who is proficient in C#. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

You are standing in a store and want to pay. Your task is to determine which of the three available queues to join, depending on the number of customers in the queue and its processing speed. The three queues process customers at the following rate:

- Queue 1: 1 customer per 45 seconds
- Queue 2: 1 customer per 30 seconds
- Queue 3: 1 customer per 12 seconds

We expect you to define a method named `Store.QueueWithMinimalWaitingTime`, which takes the number of customers in each queue and returns the number of the queue with the minimal waiting time.

For example:

```csharp
Store.QueueWithMinimalWaitingTime(customersInQueue1: 2, customersInQueue2: 3, customersInQueue3: 5)
// Returns: 3
```

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any [console output][programiz.com-basic-input-output] will be shown too. You can write to the console using:

```csharp
Console.WriteLine("Debug message");
```

[programiz.com-basic-input-output]: https://www.programiz.com/csharp-programming/basic-input-output
