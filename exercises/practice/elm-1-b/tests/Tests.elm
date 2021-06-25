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
        , test "retrieve large number of pizzas" <|
            \() ->
                retrieveMenu "formaggio (v) 8€, tonno 10€, regina 11€, margherita (v) 7€, caprese (v) 8€, hawaii 9€"
                    |> Expect.equal [ formaggio, tonno, regina, margherita, caprese, hawaii ]
        ]


formaggio : Pizza
formaggio =
    Pizza "formaggio" True 8


regina : Pizza
regina =
    Pizza "regina" False 11


tonno : Pizza
tonno =
    Pizza "tonno" False 10


margherita : Pizza
margherita =
    Pizza "margherita" True 7


caprese : Pizza
caprese =
    Pizza "caprese" True 8


hawaii : Pizza
hawaii =
    Pizza "hawaii" False 9
