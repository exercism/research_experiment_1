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
    find "(\\w+)( \\(v\\))?, ([^\\d]+), (\\d+)€" stringMenu
        |> List.filterMap (.submatches >> toPizza)


find : String -> String -> List Regex.Match
find pattern string =
    Regex.find (Maybe.withDefault Regex.never <| Regex.fromString pattern) string


toPizza : List (Maybe String) -> Maybe Pizza
toPizza submatches =
    case submatches of
        (Just name) :: Nothing :: (Just ingredients) :: (Just price) :: [] ->
            Just (Pizza name False (String.split ", " ingredients) (Maybe.withDefault 0 (String.toInt price)))

        (Just name) :: (Just _) :: (Just ingredients) :: (Just price) :: [] ->
            Just (Pizza name True (String.split ", " ingredients) (Maybe.withDefault 0 (String.toInt price)))

        _ ->
            Nothing
