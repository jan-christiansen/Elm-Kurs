module Main exposing (..)

import Lib exposing (..)


type alias State =
    ( Float, Float )


initial : State
initial =
    ( 0, 0 )


update : Event -> State -> State
update event ( x, y ) =
    case event of
        _ ->
            ( x, y )


scene : State -> Picture
scene ( x, y ) =
    image ( 45, 45 ) "http://elm-lang.org/imgs/mario/stand/right.gif" |> move ( x, y )


main =
    displayWithState initial scene update
