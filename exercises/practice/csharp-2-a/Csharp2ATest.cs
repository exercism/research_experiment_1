using Xunit;

public class SentenceTest
{
    [Fact]
    public void OneWordWithOneVowel() =>
        Assert.Equal("a", Sentence.WordWithMostVowels("a"));

    [Fact]
    public void OneWordWithOneVowelAndOneConsonant() =>
        Assert.Equal("oh", Sentence.WordWithMostVowels("oh"));

    [Fact]
    public void OneWordWithTwoVowelsAndOneConsonant() =>
        Assert.Equal("tea", Sentence.WordWithMostVowels("tea"));

    [Fact]
    public void LongestWordIsNotWordWithMostVowels() =>
        Assert.Equal("area", Sentence.WordWithMostVowels("the area of a circle"));

    [Fact]
    public void LastWordIsWordWithMostVowels() =>
        Assert.Equal("cooking", Sentence.WordWithMostVowels("do you fancy cooking"));

    [Fact]
    public void MixedCasing() =>
        Assert.Equal("YOUR", Sentence.WordWithMostVowels("TEST YOUR MIGHT"));

    [Fact]
    public void IgnoreWordWithoutVowels() =>
        Assert.Equal("guitarist", Sentence.WordWithMostVowels("fantastic rhythm guitarist"));

    [Fact]
    public void WordWithAllVowels() =>
        Assert.Equal("Sequoia", Sentence.WordWithMostVowels("Mountain Sequoia Trees"));

    [Fact]
    public void TieBreakerWithEquallyLongWords() =>
        Assert.Equal("old", Sentence.WordWithMostVowels("her old dad"));

    [Fact]
    public void TieBreakerWithFirstWordBeingWinner() =>
        Assert.Equal("evening", Sentence.WordWithMostVowels("evening Aeon multiple"));

    [Fact]
    public void TieBreakerWithLastWordBeingWinner() =>
        Assert.Equal("plains", Sentence.WordWithMostVowels("a bear was seen on the plains"));
}