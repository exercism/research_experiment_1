using System;

public static class Store
{
    private const int Queue1SecondsPerCustomer = 45;
    private const int Queue2SecondsPerCustomer = 30;
    private const int Queue3SecondsPerCustomer = 12;

    public static int QueueWithMinimalWaitingTime(int customersInQueue1, int customersInQueue2, int customersInQueue3)
    {
        var queues = new[]
        {
           new Queue(1, TimeSpan.FromSeconds(Queue1SecondsPerCustomer)) { Customers = customersInQueue1 },
           new Queue(2, TimeSpan.FromSeconds(Queue2SecondsPerCustomer)) { Customers = customersInQueue2 },
           new Queue(3, TimeSpan.FromSeconds(Queue3SecondsPerCustomer)) { Customers = customersInQueue3 },
       };

        Array.Sort(queues);

        return queues[0].Number;
    }

    public static int ExtraTillsToOpen(int customersInQueue1, int customersInQueue2, int customersInQueue3)
    {
        throw new System.NotImplementedException("Please implement the Store.ExtraTillsToOpen method");
    }
}

public class Queue : IComparable<Queue>
{
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

    public int CompareTo(Queue other)
    {
        return WaitingTime().CompareTo(other.WaitingTime());
    }
}