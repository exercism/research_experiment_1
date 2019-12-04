using System;

public static class SentenceImperative
{
    public static string WordWithMostVowels(string sentence)
    {
        var words = sentence.Split(' ');
        string wordWithMostVowels = null;
        var mostVowelsPerWord = -1;
        var mostConsecutiveConsonantsPerWord = -1;

        foreach (var word in words)
        {
            var vowels = 0;
            var maxConsecutiveConsonants = 0;
            var currentConsecutiveConsonants = 0;

            foreach (var character in word)
            {
                var lowerCharacter = char.ToLower(character);
                if (lowerCharacter == 'a' || lowerCharacter == 'e' || lowerCharacter == 'i' || lowerCharacter == 'o' || lowerCharacter == 'u')
                {
                    vowels++;
                    currentConsecutiveConsonants = 0;
                }
                else
                {
                    currentConsecutiveConsonants++;
                    maxConsecutiveConsonants = Math.Max(maxConsecutiveConsonants, currentConsecutiveConsonants);
                }
            }

            if (vowels > mostVowelsPerWord || 
                vowels == mostVowelsPerWord && maxConsecutiveConsonants > mostConsecutiveConsonantsPerWord)
            {
                mostVowelsPerWord = vowels;
                wordWithMostVowels = word;
                mostConsecutiveConsonantsPerWord = maxConsecutiveConsonants;
            }
        }

        return wordWithMostVowels;
    }
}