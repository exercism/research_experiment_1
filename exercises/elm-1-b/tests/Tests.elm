module Tests exposing (tests)

import Expect
import Pizza exposing (Pizza, retrieveMenu)
import Test exposing (..)


tests : Test
tests =
    describe "Pizza"
        [ test "retrieve single pizza" <|
            \() ->
                retrieveMenu "regina 11€"
                    |> Expect.equal [ regina ]
        , test "retrieve single vegetarian pizza" <|
            \() ->
                retrieveMenu "formaggio (v) 8€"
                    |> Expect.equal [ formaggio ]
        , test "retrieve multiple pizzas" <|
            \() ->
                retrieveMenu "formaggio (v) 8€, regina 11€"
                    |> Expect.equal [ formaggio, regina ]
        ]


formaggio : Pizza
formaggio =
    Pizza "formaggio" True 8


regina : Pizza
regina =
    Pizza "regina" False 11
