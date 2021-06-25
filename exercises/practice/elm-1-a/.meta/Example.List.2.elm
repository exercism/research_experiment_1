module AggregateScorers exposing (..)


aggregate : List ( String, Int ) -> ( String, Int ) -> List ( String, Int )
aggregate current ( newName, newCount ) =
    case current of
        [] ->
            [ ( newName, newCount ) ]

        ( name, count ) :: tail ->
            if name == newName then
                ( name, count + newCount ) :: tail
            else
                ( name, count ) :: aggregate tail ( newName, newCount )


aggregateAcc : List ( String, Int ) -> List ( String, Int ) -> List ( String, Int )
aggregateAcc list1 list2 =
    case list2 of
        [] ->
            list1

        head :: tail ->
            aggregateAcc (aggregate list1 head) tail


format : ( String, Int ) -> String
format ( name, count ) =
    if count == 1 then
        name
    else
        name ++ " (" ++ String.fromInt count ++ ")"


aggregateScorers : List String -> List String
aggregateScorers playerNames =
    let
        prepared =
            List.map (\x -> ( x, 1 )) playerNames

        aggregated =
            aggregateAcc [] prepared
    in
        List.map format aggregated
            |> List.sort
