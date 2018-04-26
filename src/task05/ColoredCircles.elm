module Main exposing (..)

import Lib exposing (..)


pic i =
    square (10 * i)


scene =
    group
        [ pic 1
        , pic 2
        , pic 3
        , pic 4
        , pic 5
        , pic 6
        , pic 7
        , pic 8
        , pic 9
        , pic 10
        ]


main =
    display scene
