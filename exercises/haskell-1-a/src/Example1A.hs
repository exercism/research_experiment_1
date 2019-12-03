
module Example1A (wordsWithMostVowels) where

import Data.List (maximumBy)
import Data.Ord (comparing)
import Data.Char (toLower)
import Data.Set (fromList)

wordsWithMostVowels :: String -> String
wordsWithMostVowels =
  maximumBy (comparing vowelCount) . words
  where vowelCount = length . filter isVowel

isVowel :: Char -> Bool
isVowel = (`elem` fromList "aeiou") . toLower
