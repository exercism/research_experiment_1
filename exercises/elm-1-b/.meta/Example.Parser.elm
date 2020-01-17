module Pizza exposing (Pizza, retrieveMenu)

import Parser exposing ((|.), (|=), Parser)


type alias Pizza =
    { name : String
    , vegetarian : Bool
    , price : Int
    }


retrieveMenu : String -> List Pizza
retrieveMenu stringMenu =
    Parser.run menuParser stringMenu
        |> Result.withDefault []


menuParser : Parser (List Pizza)
menuParser =
    Parser.sequence
        { start = ""
        , separator = ","
        , end = ""
        , spaces = Parser.spaces
        , item = pizzaParser
        , trailing = Parser.Optional
        }


pizzaParser : Parser Pizza
pizzaParser =
    Parser.succeed Pizza
        |= wordParser
        |. Parser.spaces
        |= vegetarianParser
        |. Parser.spaces
        |= Parser.int
        |. Parser.symbol "€"


wordParser : Parser String
wordParser =
    Parser.chompWhile Char.isAlpha
        |> Parser.getChompedString


vegetarianParser : Parser Bool
vegetarianParser =
    Parser.oneOf
        [ Parser.map (always True) (Parser.symbol "(v)")
        , Parser.succeed False
        ]
