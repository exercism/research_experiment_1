module Pizza exposing (Pizza, retrieveMenu)


type alias Pizza =
    { name : String
    , vegetarian : Bool
    , ingredients : List String
    , price : Int
    }


retrieveMenu : String -> List Pizza
retrieveMenu stringMenu =
    String.split ", " stringMenu
        |> List.filterMap parsePizza


parsePizza : String -> Maybe Pizza
parsePizza str =
    let
        pizzaItems =
            String.split " " str

        name =
            List.head pizzaItems

        vegetarian =
            Just (String.contains "(v)" str)

        price =
            List.head (List.reverse pizzaItems)
                |> Maybe.andThen (String.dropRight 1 >> String.toInt)
    in
    Maybe.map4 Pizza
        name
        vegetarian
        (Just [])
        price
