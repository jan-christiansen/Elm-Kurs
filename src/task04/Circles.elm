module Main exposing (..)

import Lib exposing (..)


pic i =
    square (10 * i)


scene =
    group []


main =
    display scene
