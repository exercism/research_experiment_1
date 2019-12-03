{-# LANGUAGE RecordWildCards #-}
module Main where

import Data.Foldable (for_)
import Test.Hspec (describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import Haskell1A (wordsWithMostVowels)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} $
  describe "wordsWithMostVowels" $
    for_ cases test
  where
    test Case{..} =
      it ("finds the longest word in " ++ show input) $
        wordsWithMostVowels input `shouldBe` expected

data Case = Case
  { input :: String
  , expected :: String
  }

cases :: [Case]
cases =
  [ Case "at" "at"
  , Case "at the races" "races"
  , Case "Where will you go to tomorrow" "tomorrow"
  , Case "Circle Area " "Area"
  ]
