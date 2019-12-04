module Haskell1B (Queue(..), minimumByWaiting) where

data Queue = Queue
  { queueSpeed :: Int
  , queueLength :: Int
  } deriving (Show, Eq)

minimumByWaiting :: [Queue] -> Queue
minimumByWaiting = error "You need to implement this."
