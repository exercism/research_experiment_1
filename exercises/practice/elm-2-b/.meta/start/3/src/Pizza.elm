module Pizza exposing (Pizza, retrieveMenu)

import Regex


type alias Pizza =
    { name : String
    , vegetarian : Bool
    , ingredients : List String
    , price : Int
    }


retrieveMenu : String -> List Pizza
retrieveMenu stringMenu =
    find "(\\w*)( \\(v\\))? (\\d+)€" stringMenu
        |> List.filterMap (.submatches >> toPizza)


find : String -> String -> List Regex.Match
find pattern string =
    Regex.find (Maybe.withDefault Regex.never <| Regex.fromString pattern) string


toPizza : List (Maybe String) -> Maybe Pizza
toPizza submatches =
    case submatches of
        (Just name) :: Nothing :: (Just price) :: [] ->
            Just (Pizza name False [] (Maybe.withDefault 0 (String.toInt price)))

        (Just name) :: (Just _) :: (Just price) :: [] ->
            Just (Pizza name True [] (Maybe.withDefault 0 (String.toInt price)))

        _ ->
            Nothing
