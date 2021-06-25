module AggregateScorers exposing (..)


countScorers : List String -> List ( String, Int )
countScorers playerNames =
    case playerNames of
        [] ->
            []

        player :: rest ->
            let
                restCounts =
                    countScorers rest

                isPlayer =
                    \( name, score ) -> name == player

                playerExists =
                    List.any isPlayer restCounts

                incrementPlayerCount =
                    \list ->
                        List.map
                            (\( name, score ) ->
                                if name == player then
                                    ( player, score + 1 )
                                else
                                    ( player, score )
                            )
                            list
            in
                if playerExists then
                    incrementPlayerCount restCounts
                else
                    ( player, 1 ) :: restCounts


formatScorerCount : ( String, Int ) -> String
formatScorerCount ( name, score ) =
    if score == 1 then
        name
    else
        String.concat [ name, " (", String.fromInt score, ")" ]


aggregateScorers : List String -> List String
aggregateScorers playerNames =
    countScorers playerNames
        |> List.map formatScorerCount
        |> List.sort
