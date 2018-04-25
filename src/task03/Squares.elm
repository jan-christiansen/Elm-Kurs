module Main exposing (..)

import Lib exposing (..)


scene =
    group
        [ square 10
        , square 20
        , square 30
        , square 40
        , square 50
        , square 60
        , square 70
        , square 80
        , square 90
        , square 100
        ]


main =
    display scene
