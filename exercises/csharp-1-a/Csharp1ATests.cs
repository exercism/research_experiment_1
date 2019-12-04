using Xunit;

public class SentenceTest
{
    public static TheoryData<string, string> SentenceAndWordWithMostVowels = new TheoryData<string, string>
    {
        { "at", "at" },
        { "air", "air" },
        { "lungs air", "air" },
        { "breathe lungs air", "breathe" },
        { "at the races", "races" },
        { "Where will you go to tomorrow", "tomorrow" },
        { "Circle Area", "Area" },
        { "Test Your Might", "Your" },
        { "Extremely fresh vegetables", "vegetables" }
    };

    [Theory]
    [MemberData(nameof(SentenceAndWordWithMostVowels))]
    public void WordWithMostVowels(string sentence, string expected) =>
        Assert.Equal(expected, Sentence.WordWithMostVowels(sentence), "Hallow");
}