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
        , test "retrieve large number of pizzas" <|
            \() ->
                retrieveMenu "formaggio (v), tomato sauce, emmental, 8€, tonno, tomato sauce, tuna, 10€, regina, tomato sauce, ham, mushrooms, cantal, 11€, margherita (v), tomato sauce, mozzarella, 7€, caprese (v), tomato sauce, spinach, mozzarella, 8€, hawaii, tomato sauce, pineapple, ham, 9€"
                    |> Expect.equal [ formaggio, tonno, regina, margherita, caprese, hawaii ]
        ]


formaggio : Pizza
formaggio =
    Pizza "formaggio" True [ "tomato sauce", "emmental" ] 8


regina : Pizza
regina =
    Pizza "regina" False [ "tomato sauce", "ham", "mushrooms", "cantal" ] 11


tonno : Pizza
tonno =
    Pizza "tonno" False [ "tomato sauce", "tuna" ] 10


margherita : Pizza
margherita =
    Pizza "margherita" True [ "tomato sauce", "mozzarella" ] 7


caprese : Pizza
caprese =
    Pizza "caprese" True [ "tomato sauce", "spinach", "mozzarella" ] 8


hawaii : Pizza
hawaii =
    Pizza "hawaii" False [ "tomato sauce", "pineapple", "ham" ] 9
