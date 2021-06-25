using Xunit;

public class StoreTest
{
    [Fact]
    public void OnlyEmptyQueueIsQueue1() =>
        Assert.Equal(1, Store.QueueWithMinimalWaitingTime(customersInQueue1: 0, customersInQueue2: 1, customersInQueue3: 2));

    [Fact]
    public void OnlyEmptyQueueIsQueue2() =>
        Assert.Equal(2, Store.QueueWithMinimalWaitingTime(customersInQueue1: 3, customersInQueue2: 0, customersInQueue3: 2));

    [Fact]
    public void OnlyEmptyQueueIsQueue3() =>
        Assert.Equal(3, Store.QueueWithMinimalWaitingTime(customersInQueue1: 1, customersInQueue2: 1, customersInQueue3: 0));

    [Fact]
    public void AllQueuesHaveSameNumberOfCustomersInQueue() =>
        Assert.Equal(3, Store.QueueWithMinimalWaitingTime(customersInQueue1: 5, customersInQueue2: 5, customersInQueue3: 5));

    [Fact]
    public void NonEmptyQueuesWithFastestQueueHasMinimalWaitingTime() =>
        Assert.Equal(3, Store.QueueWithMinimalWaitingTime(customersInQueue1: 2, customersInQueue2: 5, customersInQueue3: 4));

    [Fact]
    public void NonEmptyQueuesWithMiddleQueueHasMinimalWaitingTime() =>
        Assert.Equal(2, Store.QueueWithMinimalWaitingTime(customersInQueue1: 3, customersInQueue2: 1, customersInQueue3: 6));

    [Fact]
    public void NonEmptyQueuesWithSlowestQueueHasMinimalWaitingTime() =>
        Assert.Equal(1, Store.QueueWithMinimalWaitingTime(customersInQueue1: 2, customersInQueue2: 6, customersInQueue3: 15));

    [Fact]
    public void EmptyQueuesDontRequireExtraTills() =>
        Assert.Equal(0, Store.ExtraTillsToOpen(customersInQueue1: 0, customersInQueue2: 0, customersInQueue3: 0));
    
    [Fact]
    public void OneQueueExactlyMatchingMaximumWaitingTimeDoesntRequireExtraTills() =>
        Assert.Equal(0, Store.ExtraTillsToOpen(customersInQueue1: 2, customersInQueue2: 2, customersInQueue3: 2));

    [Fact]
    public void OneQueueExactlyMatchingMaximumWaitingTimeRequiresOneExtraTill() =>
        Assert.Equal(1, Store.ExtraTillsToOpen(customersInQueue1: 5, customersInQueue2: 1, customersInQueue3: 5));
    
    [Fact]
    public void OneQueueExactlyMatchingMaximumCapacityDoesntRequireExtraTills() =>
        Assert.Equal(0, Store.ExtraTillsToOpen(customersInQueue1: 1, customersInQueue2: 1, customersInQueue3: 6));
    
    [Fact]
    public void MultipleQueuesExceedMaximumCapacityRequiresOneExtraTill() =>
        Assert.Equal(1, Store.ExtraTillsToOpen(customersInQueue1: 5, customersInQueue2: 7, customersInQueue3: 0));
    
    [Fact]
    public void MultipleQueuesExceedMaximumCapacityRequireTwoExtraTills() =>
        Assert.Equal(2, Store.ExtraTillsToOpen(customersInQueue1: 9, customersInQueue2: 7, customersInQueue3: 8));
    
    [Fact]
    public void MultipleQueuesExceedMaximumWaitingTimeRequireTwoExtraTills() =>
        Assert.Equal(1, Store.ExtraTillsToOpen(customersInQueue1: 5, customersInQueue2: 1, customersInQueue3: 5));
}
