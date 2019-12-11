using System;

public static class Store
{
    private const int Queue1SecondsPerCustomer = 45;
    private const int Queue2SecondsPerCustomer = 30;
    private const int Queue3SecondsPerCustomer = 12;

    public static int QueueWithMinimalWaitingTime(int customersInQueue1, int customersInQueue2, int customersInQueue3)
    {
        var queue1Time = customersInQueue1 * Queue1SecondsPerCustomer;
        var queue2Time = customersInQueue2 * Queue2SecondsPerCustomer;
        var queue3Time = customersInQueue3 * Queue3SecondsPerCustomer;

        if (queue1Time < queue2Time && queue1Time < queue3Time)
            return 1;

        if (queue2Time < queue1Time && queue2Time < queue3Time)
            return 2;

        return 3;
    }

    public static int ExtraTillsToOpen(int customersInQueue1, int customersInQueue2, int customersInQueue3)
    {
        throw new NotImplementedException("Please implement the Store.ExtraTillsToOpen method");
    }
}