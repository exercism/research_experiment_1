module AggregateScorers exposing (..)

type alias Scorer = 
    { playerName: String
    , goals: Int
    }

aggregateScorers : List String -> List String
aggregateScorers playerNames =
    List.map (scorerWithGoalsFromDuplicates playerNames) playerNames
    |> List.map formatScorer
    |> List.foldr keepUnique []
    |> List.sort
   
scorerWithGoalsFromDuplicates : List String -> String -> Scorer
scorerWithGoalsFromDuplicates playerNames playerName  =
    let
        goals = List.filter (\p -> p == playerName) playerNames |> List.length 
    in
        Scorer playerName goals

formatScorer : Scorer -> String
formatScorer scorer  =
    if scorer.goals > 1 then
        scorer.playerName ++ " (" ++ String.fromInt scorer.goals ++ ")"
    else
        scorer.playerName

keepUnique : String -> List String -> List String
keepUnique x xs  =
    if List.any (\s -> s == x) xs then
        xs
    else
        x :: xs
