module Tests exposing (tests)

import Expect
import AggregateScorers exposing (..)
import Test exposing (..)


tests : Test
tests =
    describe "AggregateScorers"
        [ test "doesn't change a single scorer" <|
            \() ->
                aggregateScorers [ "Anna" ]
                |> Expect.equal [ "Anna" ]
        , test "doesn't change multiple unique scorers" <|
            \() ->
                aggregateScorers [ "Anna", "Lisa" ]
                |> Expect.equal [ "Anna", "Lisa" ]  
        , test "converts duplicates in to goals" <|
            \() ->
                aggregateScorers [ "Anna", "Anna" ]
                |> Expect.equal [ "Anna (2)" ]                    
        , test "orders alphabetically" <|
            \() ->
                aggregateScorers [ "Lisa", "Anna" ]
                |> Expect.equal [ "Anna", "Lisa" ]  
        , test "converts duplicates into goals and maintain single scorers" <|
            \() ->
                aggregateScorers [ "Lisa", "Anna", "Anna" ]
                |> Expect.equal [ "Anna (2)", "Lisa" ]                    
        ]
