module Tests exposing (tests)

import Expect
import AggregateScorers exposing (..)
import Test exposing (..)


tests : Test
tests =
    describe "AggregateScorers"
        [ test "adds brackets to goal time for single scorer" <|
            \() ->
                aggregateScorers [ "Anna 21" ]
                |> Expect.equal [ "Anna (21)" ]
        , test "adds brackets to goal time for multiple unique scorers" <|
            \() ->
                aggregateScorers [ "Anna 13", "Lisa 17" ]
                |> Expect.equal [ "Anna (13)", "Lisa (17)" ]  
        , test "adds comma separated goal times for duplicate scorers" <|
            \() ->
                aggregateScorers [ "Anna 28", "Anna 32" ]
                |> Expect.equal [ "Anna (28, 32)" ]                    
        , test "orders alphabetically" <|
            \() ->
                aggregateScorers [ "Lisa 43", "Anna 47" ]
                |> Expect.equal [ "Anna (47)", "Lisa (43)" ]  
        , test "adds comma separated goal times for duplicates and maintain single scorers" <|
            \() ->
                aggregateScorers [ "Lisa 76", "Anna 78", "Anna 82" ]
                |> Expect.equal [ "Anna (78, 82)", "Lisa (76)" ]                    
        ]
