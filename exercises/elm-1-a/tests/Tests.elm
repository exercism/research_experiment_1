module Tests exposing (tests)

import Expect
import AggregateScorers exposing (..)
import Test exposing (..)


tests : Test
tests =
    describe "AggregateScorers"
        [ test "single scorer is not changed" <|
            \() ->
                aggregateScorers [ "Anna" ]
                |> Expect.equal [ "Anna" ]
        , test "multiple unique scorers are unchanged" <|
            \() ->
                aggregateScorers [ "Anna", "Lisa" ]
                |> Expect.equal [ "Anna", "Lisa" ]  
        , test "duplicate names score a goal for each duplicate" <|
            \() ->
                aggregateScorers [ "Anna", "Anna" ]
                |> Expect.equal [ "Anna (2)" ]                    
        , test "orders alphabetically" <|
            \() ->
                aggregateScorers [ "Lisa", "Anna" ]
                |> Expect.equal [ "Anna", "Lisa" ]  
        ]
