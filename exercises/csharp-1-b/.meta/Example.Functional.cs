using System.Linq;

public static class Store
{
    private const int Queue1SecondsPerCustomer = 5;
    private const int Queue2SecondsPerCustomer = 2;
    private const int Queue3SecondsPerCustomer = 1;

    public static int QueueWithMinimalWaitingTime(int customersInQueue1, int customersInQueue2, int customersInQueue3)
    {
        var queues = new[]
        {
            (Number: 1, SecondsPerCustomer: Queue1SecondsPerCustomer, Customers: customersInQueue1),
            (Number: 2, SecondsPerCustomer: Queue2SecondsPerCustomer, Customers: customersInQueue2),
            (Number: 3, SecondsPerCustomer: Queue3SecondsPerCustomer, Customers: customersInQueue3),
        };

        return queues
            .OrderBy(queue => queue.Customers * queue.SecondsPerCustomer)
            .Select(queue => queue.Number)
            .First();
    }
}