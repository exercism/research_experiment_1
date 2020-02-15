module Pizza exposing (Pizza, retrieveMenu)


type alias Pizza =
    { name : String
    , vegetarian : Bool
    , ingredients : List String
    , price : Int
    }


retrieveMenu : String -> List Pizza
retrieveMenu stringMenu =
    String.split "€" stringMenu
        |> List.filterMap parsePizza


parsePizza : String -> Maybe Pizza
parsePizza str =
    let
        pizzaItems =
            if String.startsWith ", " str then
                String.split ", " (String.dropLeft 2 str)

            else
                String.split ", " str

        -- Just "name (v)"
        firstItem =
            List.head pizzaItems

        name =
            Maybe.map (String.split " ") firstItem
                |> Maybe.andThen List.head

        vegetarian =
            Maybe.map (String.contains "(v)") firstItem

        price =
            List.head (List.reverse pizzaItems)
                |> Maybe.andThen String.toInt

        ingredients =
            List.drop 1 pizzaItems
                |> List.reverse
                |> List.drop 1
                |> List.reverse
                |> Just
    in
    Maybe.map4 Pizza
        name
        vegetarian
        ingredients
        price
