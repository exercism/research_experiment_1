using System;
using System.Linq;

public static class Store
{
    private const int Queue1SecondsPerCustomer = 45;
    private const int Queue2SecondsPerCustomer = 30;
    private const int Queue3SecondsPerCustomer = 12;

    public static int QueueWithMinimalWaitingTime(int customersInQueue1, int customersInQueue2, int customersInQueue3)
    {
        var queues = CreateQueues(customersInQueue1, customersInQueue2, customersInQueue3);

        Array.Sort(queues);

        return queues[0].Number;
    }

    public static int ExtraTillsToOpen(int customersInQueue1, int customersInQueue2, int customersInQueue3)
    {
        var queues = CreateQueues(customersInQueue1, customersInQueue2, customersInQueue3);
        var customersToMoveToNewTill = queues.Sum(queue => queue.CustomersToMoveToNewTill());

        return (int)Math.Ceiling(customersToMoveToNewTill / (float)Queue.MaximumQueueLength);
    }

    private static Queue[] CreateQueues(int customersInQueue1, int customersInQueue2, int customersInQueue3) =>
        new[]
        {
            new Queue(1, TimeSpan.FromSeconds(Queue1SecondsPerCustomer)) { Customers = customersInQueue1 },
            new Queue(2, TimeSpan.FromSeconds(Queue2SecondsPerCustomer)) { Customers = customersInQueue2 },
            new Queue(3, TimeSpan.FromSeconds(Queue3SecondsPerCustomer)) { Customers = customersInQueue3 },
        };
}

public class Queue : IComparable<Queue>
{
    public const int MaximumQueueLength = 6;
    private static readonly TimeSpan MaximumQueueWaitingTime = TimeSpan.FromSeconds(120);

    public int Number { get; }
    public TimeSpan WaitingTimePerCustomer { get; }
    public int Customers { get; set; }

    public Queue(int number, TimeSpan waitingTimePerCustomer)
    {
        Number = number;
        WaitingTimePerCustomer = waitingTimePerCustomer;
    }

    public TimeSpan WaitingTime()
    {
        return Customers * WaitingTimePerCustomer;
    }

    public int CustomersToMoveToNewTill()
    {
        var customersToMoveToNewTill = 0;
        var customers = Customers;

        while (customers > MaximumQueueLength || customers * WaitingTimePerCustomer > MaximumQueueWaitingTime)
        {
            customersToMoveToNewTill++;
            customers--;
        }

        return customersToMoveToNewTill;
    }

    public int CompareTo(Queue other)
    {
        return WaitingTime().CompareTo(other.WaitingTime());
    }
}