module Pizza exposing (Pizza, retrieveMenu)

import Parser exposing ((|.), (|=), Parser)


type alias Pizza =
    { name : String
    , vegetarian : Bool
    , ingredients : List String
    , price : Int
    }


retrieveMenu : String -> List Pizza
retrieveMenu stringMenu =
    Parser.run (sequenceParser "," pizzaParser) stringMenu
        |> Result.withDefault []


sequenceParser : String -> Parser a -> Parser (List a)
sequenceParser separator itemParser =
    Parser.sequence
        { start = ""
        , separator = separator
        , end = ""
        , spaces = Parser.spaces
        , item = itemParser
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
