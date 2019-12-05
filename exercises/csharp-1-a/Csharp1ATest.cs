using Xunit;

public class SentenceTest
{
    [Fact]
    public void OneWordWithOneVowel() =>
        Assert.Equal("a", Sentence.WordWithMostVowels("a"));
    
    [Fact]
    public void OneWordWithOneVowelAndOneConsonant() =>
        Assert.Equal("at", Sentence.WordWithMostVowels("at"));
    
    [Fact]
    public void OneWordWithTwoVowelsAndOneConsonant() =>
        Assert.Equal("tea", Sentence.WordWithMostVowels("tea"));
    
    [Fact]
    public void LongestWordIsNotWordWithMostVowels() =>
        Assert.Equal("area", Sentence.WordWithMostVowels("the area of a circle"));
    
    [Fact]
    public void LastWordIsWordWithMostVowels() =>
        Assert.Equal("vegetables", Sentence.WordWithMostVowels("extremely fresh vegetables"));
    
    [Fact]
    public void MixedCasing() =>
        Assert.Equal("YOUR", Sentence.WordWithMostVowels("TEST YOUR MIGHT"));
    
    [Fact]
    public void IgnoreWordWithoutVowels() =>
        Assert.Equal("great", Sentence.WordWithMostVowels("great rhythm"));
}