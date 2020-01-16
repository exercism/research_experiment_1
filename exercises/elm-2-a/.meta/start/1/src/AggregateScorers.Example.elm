module AggregateScorers exposing (..)

import Dict exposing (..)
import Array exposing (..)


type alias Scorer =
    { playerName : String
    , goals : List String
    }


aggregateScorers : List String -> List String
aggregateScorers goals =
    let
        playerNameGoalTimes =
            List.map parseGoal goals

        playerNames =
            List.map Tuple.first playerNameGoalTimes
    in
        List.map (scorerWithGoalsFromDuplicates playerNames playerNameGoalTimes) playerNames
            |> List.map formatScorer
            |> List.foldr keepUnique []
            |> List.sort


parseGoal : String -> ( String, String )
parseGoal goal =
    let
        split =
            Array.fromList (String.split " " goal)

        playerName =
            Array.get 0 split
                |> Maybe.withDefault ""

        goalTime =
            Array.get 1 split
                |> Maybe.withDefault ""
    in
        ( playerName, goalTime )


scorerWithGoalsFromDuplicates : List String -> List ( String, String ) -> String -> Scorer
scorerWithGoalsFromDuplicates playerNames playerNameGoalTimes playerName =
    let
        goalTimes =
            List.filter (\( p, g ) -> p == playerName) playerNameGoalTimes
                |> List.map Tuple.second
    in
        Scorer playerName goalTimes


formatScorer : Scorer -> String
formatScorer player =
    player.playerName
        ++ " ("
        ++ String.join ", " player.goals
        ++ ")"


keepUnique : String -> List String -> List String
keepUnique x xs =
    if List.any (\s -> s == x) xs then
        xs
    else
        x :: xs
