using System;

public static class Store
{
    private const int Queue1SecondsPerCustomer = 45;
    private const int Queue2SecondsPerCustomer = 30;
    private const int Queue3SecondsPerCustomer = 12;
    private const int MaximumQueueLength = 6;
    private const int MaximumQueueWaitingTimeInSeconds = 120;

    public static int QueueWithMinimalWaitingTime(int customersInQueue1, int customersInQueue2, int customersInQueue3)
    {
        if (Queue1WaitingTime(customersInQueue1) < Queue2WaitingTime(customersInQueue2) &&
            Queue1WaitingTime(customersInQueue1) < Queue3WaitingTime(customersInQueue3))
            return 1;

        if (Queue2WaitingTime(customersInQueue2) < Queue1WaitingTime(customersInQueue1) &&
            Queue2WaitingTime(customersInQueue2) < Queue3WaitingTime(customersInQueue3))
            return 2;

        return 3;
    }

    public static int ExtraTillsToOpen(int customersInQueue1, int customersInQueue2, int customersInQueue3)
    {
        var customersToMoveToNewTill =
            CustomersToMoveToNewTill(customersInQueue1, Queue1SecondsPerCustomer) +
            CustomersToMoveToNewTill(customersInQueue2, Queue2SecondsPerCustomer) +
            CustomersToMoveToNewTill(customersInQueue3, Queue3SecondsPerCustomer);

        return (int)Math.Ceiling(customersToMoveToNewTill / (float)MaximumQueueLength);
    }

    private static int CustomersToMoveToNewTill(int queueLength, int secondsPerCustomer)
    {
        var customersToMoveToNewTill = 0;

        while (queueLength > MaximumQueueLength || queueLength * secondsPerCustomer > MaximumQueueWaitingTimeInSeconds)
        {
            customersToMoveToNewTill++;
            queueLength--;
        }

        return customersToMoveToNewTill;
    }

    private static int Queue1WaitingTime(int customersInQueue1) => customersInQueue1 * Queue1SecondsPerCustomer;
    private static int Queue2WaitingTime(int customersInQueue2) => customersInQueue2 * Queue2SecondsPerCustomer;
    private static int Queue3WaitingTime(int customersInQueue3) => customersInQueue3 * Queue3SecondsPerCustomer;
}