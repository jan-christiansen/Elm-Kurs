module Main exposing (..)

import Lib exposing (..)


scene t =
    let
        h =
            0.005 * t
    in
    group
        [ segment ( -200, -20 ) ( 200, -20 )
        , circle 20 |> move ( 0, h )
        ]


g =
    9.81


time l =
    2 * pi * sqrt (l / g)


main =
    displayWithTime scene
