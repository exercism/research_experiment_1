using Xunit;

public class StoreTest
{
    public static TheoryData<int, int, int, int> QueueLengthsAndOptimalQueue = new TheoryData<int, int, int, int>
    {
        { 0, 1, 2, 1 },
        { 2, 0, 2, 2 },
        { 1, 1, 0, 3 },
        { 1, 2, 1, 3 },
        { 1, 2, 6, 2 },
        { 1, 3, 7, 1 }
    };

    [Theory]
    [MemberData(nameof(QueueLengthsAndOptimalQueue))]
    public void QueueWithMinimalWaitingTime(int customersInQueue1, int customersInQueue2, int customersInQueue3, int expected) =>
        Assert.Equal(expected, Store.QueueWithMinimalWaitingTime(customersInQueue1, customersInQueue2, customersInQueue3));
}