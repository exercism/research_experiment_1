using System.Linq;
using System.Text.RegularExpressions;

public static class SentenceRegex
{
    public static string WordWithMostVowels(string sentence) =>
        Regex.Split(sentence, @"\s")
            .Select(word =>
            {
                var matches = Regex.Matches(word, @"((?<vowels>[aeiuo]+)|(?<consonants>[bcdfghjklmnpqrstvwxyz]+))", RegexOptions.IgnoreCase);
                var vowels = matches.Sum(match => match.Groups["vowels"].Captures.Sum(capture => capture.Length));
                var consecutiveConsonants = matches
                    .Select(match => 
                        match.Groups["consonants"].Captures
                            .Select(capture => capture.Length)
                            .DefaultIfEmpty(0)
                            .Max())
                    .DefaultIfEmpty(0)
                    .Max();
                return (word, vowels, consecutiveConsonants);
            })
            .OrderByDescending(x => x.vowels).ThenByDescending(x => x.consecutiveConsonants)
            .Select(x => x.word)
            .First();
}