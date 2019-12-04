{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE TypeFamilies #-}
module Main where

import Data.Foldable (for_)
import GHC.Exts (IsList, Item)
import Test.Hspec (describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import Haskell1B (Queue(..), minimumByWaiting)

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} $
  describe "minimumByWaiting" $
    for_ cases test
  where
    test Case{..} =
      it description $ minimumByWaiting input `shouldBe` expected

data Case l = Case
  { description :: String
  , input :: l Queue
  , expected :: Queue
  }

cases :: (IsList (l Queue), Item (l Queue) ~ Queue) => [Case l]
cases =
  [ Case { description = "picks an empty first queue"
         , input = [Queue 5 0, Queue 2 1, Queue 1 2]
         , expected = Queue 5 0
         }
  , Case { description = "picks an empty second queue"
         , input = [Queue 5 2, Queue 2 0, Queue 1 2]
         , expected = Queue 2 0
         }
  , Case { description = "picks an empty third queue"
         , input = [Queue 5 1, Queue 2 1, Queue 1 0]
         , expected = Queue 1 0
         }
  , Case { description = "picks a least third queue"
         , input = [Queue 5 1, Queue 2 2, Queue 1 1]
         , expected = Queue 1 1
         }
  , Case { description = "picks a least second queue"
         , input = [Queue 5 1, Queue 2 2, Queue 1 6]
         , expected = Queue 2 2
         }
  , Case { description = "picks a least first queue"
         , input = [Queue 5 1, Queue 2 3, Queue 1 7]
         , expected = Queue 5 1
         }
  ]
