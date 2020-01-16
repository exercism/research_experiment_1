using System;
using System.Collections.Generic;
using System.Linq;

public static class Store
{
    private const int Queue1SecondsPerCustomer = 45;
    private const int Queue2SecondsPerCustomer = 30;
    private const int Queue3SecondsPerCustomer = 12;
    private const int MaximumQueueLength = 6;
    private const int MaximumQueueWaitingTimeInSeconds = 120;

    public static int QueueWithMinimalWaitingTime(int customersInQueue1, int customersInQueue2, int customersInQueue3) =>
        CreateQueues(customersInQueue1, customersInQueue2, customersInQueue3)
            .OrderBy(queue => queue.Customers * queue.SecondsPerCustomer)
            .Select(queue => queue.Number)
            .First();

    private static IEnumerable<(int Number, int SecondsPerCustomer, int Customers)> CreateQueues(int customersInQueue1, int customersInQueue2, int customersInQueue3) =>
        new[]
        {
            (Number: 1, SecondsPerCustomer: Queue1SecondsPerCustomer, Customers: customersInQueue1),
            (Number: 2, SecondsPerCustomer: Queue2SecondsPerCustomer, Customers: customersInQueue2),
            (Number: 3, SecondsPerCustomer: Queue3SecondsPerCustomer, Customers: customersInQueue3),
        };

    public static int ExtraTillsToOpen(int customersInQueue1, int customersInQueue2, int customersInQueue3) =>
        CreateQueues(customersInQueue1, customersInQueue2, customersInQueue3)
            .Sum(CustomersToMoveToNewTill)
            .CustomersToTills();

    private static int CustomersToMoveToNewTill((int Number, int SecondsPerCustomer, int Customers) queue)
    {
        var customersToMoveToNewTill = 0;
        var customers = queue.Customers;

        while (customers > MaximumQueueLength || customers * queue.SecondsPerCustomer > MaximumQueueWaitingTimeInSeconds)
        {
            customersToMoveToNewTill++;
            customers--;
        }

        return customersToMoveToNewTill;
    }

    private static int CustomersToTills(this int customersToMoveToNewTill) =>
        (int)Math.Ceiling(customersToMoveToNewTill / (float)MaximumQueueLength);
}