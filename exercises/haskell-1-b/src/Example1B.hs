module Example1B (Queue(..), minimumByWaiting) where

import Data.List (minimumBy)
import Data.Ord (comparing)
import Data.List.NonEmpty

data Queue = Queue
  { queueSpeed :: Int
  , queueLength :: Int
  } deriving (Show, Eq)

minimumByWaiting :: NonEmpty Queue -> Queue
minimumByWaiting = minimumBy (comparing waiting)
  where waiting (Queue a b) = a * b
