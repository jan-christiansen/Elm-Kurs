module Main exposing (..)

import Lib exposing (..)


scene t =
    let
        r =
            150

        phi =
            angle r t

        x =
            r * phi

        y =
            -r
    in
    group
        [ segment ( 0, 0 ) ( x, y )
        , circle 10 |> move ( x, y )
        ]


phi0 =
    0.3 * pi


g =
    9.81


angle r t =
    phi0 * cos (1 / sqrt (r / g) * t * 0.005)


main =
    displayWithTime scene



-- scene t =
--     let
--         alpha =
--             cos (2 * t) * pi / 3
--
--         a =
--             100 * alpha
--
--         b =
--             -100
--     in
--     group
--         [ path [ ( 0, 0 ), ( a, b ) ]
--         , circle 10 |> move ( a, b )
--         ]
--
--
-- main =
--     displayWithTime scene
