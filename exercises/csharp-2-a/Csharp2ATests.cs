using Xunit;

public class LetterCountTest
{
    public static TheoryData<string, string> SentenceAndWordWithMostVowels = new TheoryData<string, string>
    {
        { "at", "at" },
        { "air", "air" },
        { "lungs air", "air" },
        { "breathe lungs air", "breathe" },
        { "at the races", "races" },
        { "plain bear", "plain" },
        { "Reeling noses hurts", "Reeling" },
        { "Where will you go to tomorrow", "tomorrow" },
        { "Circle Area ", "Area" },
        { "evening Aeon multiple", "evening" },
        { "amoebae denim", "amoebae" },
        { "her old dad", "old" },
        { "abide Moiety apace", "Moiety" },
        { "Quaver Queer Moiety Quite", "Moiety" },
    };

    [Theory]
    [MemberData(nameof(SentenceAndWordWithMostVowels))]
    public void WordWithMostVowels(string sentence, string expected) =>
        Assert.Equal(expected, Sentence.WordWithMostVowels(sentence));
}