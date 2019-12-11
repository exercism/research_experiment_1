using System;
using System.Linq;
using System.Text.RegularExpressions;

public static class Sentence
{
    public static string WordWithMostVowels(string sentence)
    {
        return Regex.Matches(sentence, @"((?<vowels>[aeiou])|([bcdfghjklmnpqrstvwxyz]))+", RegexOptions.IgnoreCase)
            .OrderByDescending(match => match.Groups["vowels"].Captures.Count)
            .First()
            .Value;
    }
}