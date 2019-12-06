using System;
using System.Collections.Generic;
using System.Linq;

public static class Sentence
{
    public static string WordWithMostVowels(string sentence) =>
        sentence
            .Split(' ')
            .GroupBy(word => word.Count(IsVowel))
            .OrderByDescending(group => group.Key)
            .Select(group => group.OrderByDescending(ConsecutiveConsonants).First())
            .First();

    private static bool IsVowel(char character)
    {
        var vowels = new HashSet<char> { 'a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U' };
        return vowels.Contains(character);
    }

    private static bool IsConsonant(char character) =>
        Char.IsLetter(character) && !IsVowel(character);

    private static int ConsecutiveConsonants(string str)
    {
        var max = 0;
        var current = 0;

        foreach (var character in str)
        {
            if (IsConsonant(character))
            {
                current++;
                max = Math.Max(max, current);
            }
            else
            {
                current = 0;
            }
        }

        return max;
    }
}