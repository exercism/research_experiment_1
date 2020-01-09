module AggregateScorers exposing (..)

import Dict exposing (Dict)


aggregateScorers : List String -> List String
aggregateScorers playerNames =
    List.foldl increment Dict.empty playerNames
        |> Dict.toList
        |> List.map (\( name, count ) -> prettyPrint name count)


increment : String -> Dict String Int -> Dict String Int
increment name names =
    if Dict.member name names then
        Dict.update name (Maybe.map (\count -> count + 1)) names
    else
        Dict.insert name 1 names


prettyPrint : String -> Int -> String
prettyPrint name count =
    if count == 1 then
        name
    else
        name ++ " (" ++ String.fromInt count ++ ")"
