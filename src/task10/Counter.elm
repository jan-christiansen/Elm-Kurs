module Main exposing (..)

import Lib exposing (..)


initial =
    0


update event state =
    case event of
        Click ->
            state + 1

        _ ->
            state


scene state =
    text (toString state)


main =
    displayWithState initial scene update
