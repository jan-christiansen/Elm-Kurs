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
    square 40 |> move ( x, y )


main =
    displayWithState initial scene update
