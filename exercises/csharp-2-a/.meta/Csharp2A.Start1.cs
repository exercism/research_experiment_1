using System.Collections.Generic;
using System.Linq;

public static class Sentence
{
    public static string WordWithMostVowels(string sentence)
    {
        return sentence.Split(' ')
            .OrderByDescending(word => word.Count(IsVowel))
            .First();
    }

    private static bool IsVowel(char character)
    {
        var vowels = new HashSet<char> { 'a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U' };
        return vowels.Contains(character);
    }
}