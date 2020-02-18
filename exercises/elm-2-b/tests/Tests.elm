module Tests exposing (tests)

import Expect
import Pizza exposing (Pizza, retrieveMenu)
import Test exposing (..)


tests : Test
tests =
    describe "Pizza"
        [ test "retrieve single pizza" <|
            \() ->
                retrieveMenu "regina, tomato sauce, ham, mushrooms, cantal, 11€"
                    |> Expect.equal [ regina ]
        , test "retrieve single vegetarian pizza" <|
            \() ->
                retrieveMenu "formaggio (v), tomato sauce, emmental, 8€"
                    |> Expect.equal [ formaggio ]
        , test "retrieve multiple pizzas" <|
            \() ->
                retrieveMenu "formaggio (v), tomato sauce, emmental, 8€, regina, tomato sauce, ham, mushrooms, cantal, 11€"
                    |> Expect.equal [ formaggio, regina ]
        ]


formaggio : Pizza
formaggio =
    Pizza "formaggio" True ["tomato sauce", "emmental"] 8


regina : Pizza
regina =
    Pizza "regina" False ["tomato sauce", "ham", "mushrooms", "cantal"] 11
