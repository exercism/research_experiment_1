module AggregateScorers exposing (..)

import Dict exposing (..)
import Array exposing (..)

type alias Player = {
    name : String
    , goals : List Int
    }

aggregateScorers : List String -> List String
aggregateScorers playerNames =
    List.foldl  updatePlayer Dict.empty playerNames
    |> Dict.values
    |> List.map formatPlayer

updatePlayer : String -> Dict String Player -> Dict String Player
updatePlayer goal players  =
    let
        (playerName, goalTime) = parseGoal goal
        existingPlayer = Dict.get playerName players
        newPlayer = case existingPlayer of 
            Just player ->
                { player | goals = List.append player.goals [ goalTime ]  }
            Nothing ->
                (Player playerName [ goalTime ])
    in
        Dict.insert playerName newPlayer players

parseGoal : String -> (String, Int)
parseGoal goal =
    let
        split = String.split " " goal |> Array.fromList
        playerName =  
            Array.get 0 split
            |> Maybe.withDefault ""
        goalTime =  
            (Array.get 1 split)
            |> Maybe.andThen String.toInt
            |> Maybe.withDefault 0
    in
        (playerName, goalTime)

formatPlayer : Player -> String
formatPlayer player =
        player.name 
        ++ " (" 
        ++ String.join ", " (List.map String.fromInt player.goals) 
        ++ ")"

