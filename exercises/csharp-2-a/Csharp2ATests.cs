using Xunit;

public class LetterCountTest
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