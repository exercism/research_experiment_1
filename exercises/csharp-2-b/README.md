## Introduction

This is Part 2 of our research into differences in the ways in which people write C#. This exercise should take 10-15 minutes for a programmer who is proficient in C#. There is no right or wrong way to approach it - just do what feels the most natural to you. Feel free to use books, Google or Stack Overflow, just like you would if you were programming normally, but please don't actively look for a solution to the problem as this will negatively affect the research.

## Instructions

Your task is to extend existing code with new functionality. The existing code deals with a customer standing in a store and wanting to pay. There are three available queues to join, depending on the number of customers in the queue and its processing speed. The three queues process customers at the following rate:

- Queue 1: 1 customer per 45 seconds
- Queue 2: 1 customer per 30 seconds
- Queue 3: 1 customer per 12 seconds

The code you'll be working with has a method named `Store.QueueWithMinimalWaitingTime`, which takes the number of customers in each queue and returns the number of the queue with the minimal waiting time.

For example:

```csharp
Store.QueueWithMinimalWaitingTime(customersInQueue1: 2, customersInQueue2: 3, customersInQueue3: 5)
// Returns: 3
```

To try and keep customers happy, the store has issued two new rules:

- A single queue should never have more than 6 customers.
- The expected waiting time for a single queue should never be more than two minutes.

If a queue violates one of these rules (or both), one or more temporary tills should be opened. The store manager will ensure just enough customers are diverted to these new, temporary tills to have the queue match the above rules again. New tills will process 1 customer per 20 seconds.

Your job is to define a method `Store.ExtraTillsToOpen`, which takes the number of customers in each queue and returns how many extra tills should be opened in order to satisfy the above two rules (this can be zero).

For example:

```csharp
Store.ExtraTillsToOpen (customersInQueue1: 5, customersInQueue2: 1, customersInQueue3: 2)
// Returns: 1
```

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input. You can also use the fact that any [console output][programiz.com-basic-input-output] will be shown too. You can write to the console using:

```csharp
Console.WriteLine("Debug message");
```

[programiz.com-basic-input-output]: https://www.programiz.com/csharp-programming/basic-input-output
