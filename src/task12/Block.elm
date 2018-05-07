module Main exposing (..)

import Lib exposing (..)


type Direction
    = North
    | East
    | South
    | West


type State
    = Running ( Float, Float ) Direction


initial : State
initial =
    Running ( 0, 0 ) North


update : Event -> State -> State
update event s =
    case s of
        Running ( x, y ) dir ->
            case event of
                Tick ->
                    Running (step ( x, y ) dir) dir

                _ ->
                    Running ( x, y ) (newDirection event dir)


newDirection : Event -> Direction -> Direction
newDirection event dir =
    case event of
        Down ->
            South

        Up ->
            North

        Left ->
            West

        Right ->
            East

        _ ->
            dir


stepSize : Float
stepSize =
    20


step : ( Float, Float ) -> Direction -> ( Float, Float )
step ( x, y ) dir =
    case dir of
        South ->
            ( x, y )

        North ->
            ( x, y )

        West ->
            ( x, y )

        East ->
            ( x, y )


scene : State -> Picture
scene s =
    case s of
        Running ( x, y ) dir ->
            group
                [ field
                , snake |> move ( x, y )
                ]


snake : Picture
snake =
    filledRectangle blue ( 20, 20 )


field : Picture
field =
    rectangle ( 500, 500 )


main =
    displayWithState initial scene update
