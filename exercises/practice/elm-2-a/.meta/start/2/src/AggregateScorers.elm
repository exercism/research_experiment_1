module AggregateScorers exposing (..)

import Dict exposing (..)


type alias Player =
    { name : String
    , goals : Int
    }


aggregateScorers : List String -> List String
aggregateScorers playerNames =
    List.foldl updatePlayer Dict.empty playerNames
        |> Dict.values
        |> List.map formatPlayer


updatePlayer : String -> Dict String Player -> Dict String Player
updatePlayer playerName players =
    let
        existingPlayer =
            Dict.get playerName players

        newPlayer =
            case existingPlayer of
                Just player ->
                    { player | goals = player.goals + 1 }

                Nothing ->
                    (Player playerName 1)
    in
        Dict.insert playerName newPlayer players


formatPlayer : Player -> String
formatPlayer player =
    if player.goals == 1 then
        player.name
    else
        player.name ++ " (" ++ String.fromInt player.goals ++ ")"
