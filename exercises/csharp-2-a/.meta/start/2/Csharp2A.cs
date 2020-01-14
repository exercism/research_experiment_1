using System;

public static class Sentence
{
    public static string WordWithMostVowels(string sentence)
    {
        var words = sentence.Split(' ');
        string wordWithMostVowels = null;
        var mostVowelsPerWord = -1;

        foreach (var word in words)
        {
            var vowels = 0;

            foreach (var character in word)
            {
                var lowerCharacter = char.ToLower(character);
                if (lowerCharacter == 'a' || lowerCharacter == 'e' || lowerCharacter == 'i' || lowerCharacter == 'o' || lowerCharacter == 'u')
                    vowels++;
            }

            if (vowels > mostVowelsPerWord)
            {
                mostVowelsPerWord = vowels;
                wordWithMostVowels = word;
            }
        }

        return wordWithMostVowels;
    }
}