module Lib
    exposing
        ( Color
        , Event(..)
        , LineStyle
        , Picture
          -- , Timing(..)
        , alpha
        , black
        , blue
        , brown
        , circle
        , circle_
        , dashed
        , display
        , displayWithMouse
        , displayWithMouseAndTime
        , displayWithState
          -- , displayWithState_
          -- , display_
        , displayWithTime
        , dotted
        , empty
        , filledCircle
        , filledRectangle
        , green
        , group
          -- , icon
          -- , icon_
        , image
        , move
        , ngon
        , ngon_
        , orange
        , oval
        , oval_
        , path
        , path_
        , polygon
        , polygon_
        , purple
        , rectangle
        , rectangle_
        , red
        , rgb
        , rotate
        , scale
        , segment
        , solid
        , square
        , square_
        , text
        , white
        , yellow
        )

import AnimationFrame
import Collage
import Color
import Element exposing (Element)
import Html exposing (Html)
import Keyboard exposing (KeyCode)
import Mouse
import Set
import Task
import Text
import Time
import Window


-- not exported


gridsize =
    20



-- not exported


makeGrid x1 y1 x2 y2 =
    let
        x_ =
            (x1 + x2) / 2

        xh =
            x_ - x1

        y_ =
            (y1 + y2) / 2

        yh =
            y_ - y1
    in
    group
        [ group <|
            List.map
                (\i ->
                    let
                        x =
                            toFloat i * gridsize - x_
                    in
                    path_ (dotted (Color.greyscale 0.15)) [ ( x, -yh ), ( x, yh ) ]
                )
                (List.range (ceiling (x1 / gridsize)) (floor (x2 / gridsize)))
        , group <|
            List.map
                (\j ->
                    let
                        y =
                            toFloat j * gridsize - y_
                    in
                    path_ (dotted (Color.greyscale 0.15)) [ ( -xh, y ), ( xh, y ) ]
                )
                (List.range (ceiling (y1 / gridsize)) (floor (y2 / gridsize)))
        , move ( -x_, -y_ ) (Collage.filled red (Collage.circle 2))
        ]



-- type Timing
--     = Every Float
--     | FPS Float
--     | AnimationFrame
-- display_ : ( Int, Int ) -> ( Int, Int ) -> (( Float, Float ) -> Float -> Picture) -> Maybe Timing -> Signal Element.Element
-- display_ p1 p2 f =
--     displayWithState_ p1 p2 (\p t _ -> f p t) () (\_ _ _ -> identity)
-- displayWithState_ : ( Int, Int ) -> ( Int, Int ) -> (( Float, Float ) -> Float -> a -> Picture) -> a -> (Event -> ( Float, Float ) -> Float -> a -> a) -> Maybe Timing -> Signal Element.Element
-- displayWithState_ ( x1, y1 ) ( x2, y2 ) f =
--     let
--         x2_ =
--             max (x1 + 1) x2
--
--         y2_ =
--             max (y1 + 1) y2
--
--         d =
--             ( toFloat (-x1 - x2_) / 2, toFloat (-y1 - y2_) / 2 )
--     in
--     toScreen x1 y2_ (\_ p t s -> Collage.collage (x2_ - x1) (y2_ - y1) [ move d (f p t s) ]) []


type Msg msg
    = Resize Window.Size
    | User msg


type alias Model model =
    { size : Maybe Window.Size
    , user : model
    }


wrapModel : model -> ( Model model, Cmd (Msg msg) )
wrapModel model =
    ( { size = Nothing, user = model }
    , Task.perform Resize Window.size
    )


wrapUpdate :
    (msg -> model -> model)
    -> Msg msg
    -> Model model
    -> ( Model model, Cmd (Msg msg) )
wrapUpdate update msg model =
    ( case msg of
        Resize size ->
            { model | size = Just size }

        User msg ->
            { model | user = update msg model.user }
    , Cmd.none
    )


transform : Window.Size -> Mouse.Position -> ( Float, Float )
transform { width, height } { x, y } =
    ( toFloat x - toFloat width / 2, -(toFloat y) + toFloat height / 2 )


wrapView : (model -> Picture) -> Model model -> Html (Msg msg)
wrapView pic model =
    case model.size of
        Nothing ->
            Html.text "Waiting for size of window"

        Just { width, height } ->
            Element.toHtml
                (Collage.collage
                    width
                    height
                    [ --makeGrid 0 0 (toFloat width) (toFloat height)
                      --,
                      pic model.user
                    ]
                )


type BeginnerMsg
    = BeginnerMove Mouse.Position
    | BeginnerTime Time.Time


type alias BeginnerModel =
    { mouse : ( Float, Float )
    , time : Float
    }


beginnerModel : BeginnerModel
beginnerModel =
    { mouse = ( 0, 0 ), time = 0 }


beginnerView :
    (( Float, Float ) -> Float -> Picture)
    -> Model BeginnerModel
    -> Html (Msg msg)
beginnerView pic model =
    wrapView (\_ -> pic model.user.mouse model.user.time) model


display : Picture -> Program Never (Model BeginnerModel) (Msg BeginnerMsg)
display p =
    displayWithMouseAndTime (\_ _ -> p)


displayWithMouse :
    (( Float, Float ) -> Picture)
    -> Program Never (Model BeginnerModel) (Msg BeginnerMsg)
displayWithMouse pic =
    displayWithMouseAndTime (\pos _ -> pic pos)


displayWithTime :
    (Float -> Picture)
    -> Program Never (Model BeginnerModel) (Msg BeginnerMsg)
displayWithTime pic =
    displayWithMouseAndTime (\_ t -> pic t)


displayWithMouseAndTime :
    (( Float, Float ) -> Float -> Picture)
    -> Program Never (Model BeginnerModel) (Msg BeginnerMsg)
displayWithMouseAndTime pic =
    Html.program
        { init = wrapModel beginnerModel
        , view = beginnerView pic
        , update = wrapUpdate (\_ model -> model)
        , subscriptions =
            \_ ->
                Sub.batch
                    [ Window.resizes Resize
                    , Mouse.moves (User << BeginnerMove)
                    , AnimationFrame.times (User << BeginnerTime)
                    ]
        }


displayWithState :
    model
    -> (model -> Picture)
    -> (Event -> model -> model)
    -> Program Never (Model model) (Msg Event)
displayWithState initialModel view update =
    Html.program
        { init = wrapModel initialModel
        , view = wrapView view
        , update = wrapUpdate update
        , subscriptions =
            \_ ->
                Sub.batch
                    [ Window.resizes Resize
                    , Mouse.clicks (Basics.always (User Click))
                    , Keyboard.downs (User << keycodeToEvent)
                    , Time.every (50 * Time.millisecond) (User << Basics.always Tick)
                    ]
        }


keycodeToEvent : KeyCode -> Event
keycodeToEvent keyCode =
    case keyCode of
        32 ->
            Space

        37 ->
            Left

        38 ->
            Up

        39 ->
            Right

        40 ->
            Down

        _ ->
            NoEvent



-- display : ( Int, Int ) -> ( Int, Int ) -> (( Float, Float ) -> Float -> Picture) -> Maybe Timing -> Signal Element.Element
-- display p1 p2 f mt =
--     elaborateDisplay (Maybe.map (always "Zeit auf Null") mt) p1 p2 (\p t _ -> f p t) () (\_ _ _ -> identity) mt
-- displayWithState : ( Int, Int ) -> ( Int, Int ) -> (( Float, Float ) -> Float -> a -> Picture) -> a -> (Event -> ( Float, Float ) -> Float -> a -> a) -> Maybe Timing -> Signal Element.Element
-- displayWithState =
--     elaborateDisplay (Just "auf Anfang")
-- not exported
-- elaborateDisplay mr ( x1, y1 ) ( x2, y2 ) f ini upd =
--     let
--         x2_ =
--             max (x1 + 1) x2
--
--         y2_ =
--             max (y1 + 1) y2
--
--         x1_ =
--             toFloat x1
--
--         y1_ =
--             toFloat y1
--
--         x2_ =
--             toFloat x2_
--
--         y2_ =
--             toFloat y2_
--
--         grid =
--             makeGrid x1_ y1_ x2_ y2_
--
--         gridMbx =
--             Signal.mailbox False
--
--         -- value here actually irrelevant
--         gridCheck =
--             Graphics.Input.checkbox (Signal.message gridMbx.address)
--
--         restartMbx =
--             Signal.mailbox ()
--
--         restartButt =
--             case mr of
--                 Nothing ->
--                     []
--
--                 Just msg ->
--                     [ Element.spacer 10 10, Graphics.Input.button (Signal.message restartMbx.address ()) msg ]
--
--         x =
--             x2_ - x1
--
--         y =
--             y2_ - y1
--
--         d =
--             ( (-x1_ - x2_) / 2, (-y1_ - y2_) / 2 )
--
--         f_ g p t s =
--             Element.flow Element.up
--                 [ Element.flow Element.left <| Element.show p :: gridCheck g :: restartButt
--                 , Element.color (Color.greyscale 0.05) <|
--                     Element.container x y Element.middle <|
--                         Collage.collage x
--                             y
--                             ((if g then
--                                 [ grid ]
--                               else
--                                 []
--                              )
--                                 ++ [ move d (f p t s) ]
--                             )
--                 ]
--     in
--     toScreen x1
--         y2_
--         f_
--         [ Signal.map
--             (\g _ t_ state -> ( t_, { state | gridOn = g, s = upd NoEvent state.mousePos t_ state.s } ))
--             gridMbx.signal
--         , Signal.map
--             (\_ t _ state -> ( 0, { state | lastReset = t, s = ini } ))
--             restartMbx.signal
--         ]
--         ini
--         upd


type Event
    = Left
    | Right
    | Up
    | Down
    | Space
    | Click
    | Tick
    | NoEvent



-- not exported
-- toScreen x1 y2 f extra_sigs ini upd mt =
--     let
--         letters =
--             Array.fromList [ A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z ]
--     in
--     Signal.map (\( t, { gridOn, mousePos, s } ) -> f gridOn mousePos t s) <|
--         Signal.Extra.foldp_
--             (\( t, action ) ( _, state ) -> action t ((t - state.lastReset) / 1000) state)
--             (\( t, _ ) -> ( 0, { gridOn = False, mousePos = ( 0, 0 ), lastReset = t, s = ini } ))
--         <|
--             Time.timestamp <|
--                 Signal.mergeMany <|
--                     List.map (Signal.map (\event _ t_ state -> ( t_, { state | s = upd event state.mousePos t_ state.s } )))
--                         [ Signal.map (always NoEvent) <|
--                             case mt of
--                                 Nothing ->
--                                     Signal.constant 0
--
--                                 Just (Every f) ->
--                                     Time.every
--                                         (if f < 0.017 then
--                                             17
--                                          else
--                                             1000 * f
--                                         )
--
--                                 Just (FPS f) ->
--                                     Time.fps
--                                         (if f > 60 then
--                                             60
--                                          else
--                                             f
--                                         )
--
--                                 Just AnimationFrame ->
--                                     AnimationFrame.frame
--                         , Signal.map
--                             (\ks ->
--                                 case Set.toList ks of
--                                     [ 32 ] ->
--                                         Space
--
--                                     [ 37 ] ->
--                                         Left
--
--                                     [ 38 ] ->
--                                         Up
--
--                                     [ 39 ] ->
--                                         Right
--
--                                     [ 40 ] ->
--                                         Down
--
--                                     [ a ] ->
--                                         Maybe.withDefault NoEvent (Array.get (a - 65) letters)
--
--                                     _ ->
--                                         NoEvent
--                             )
--                             Keyboard.keysDown
--                         , Signal.map (always Click) Mouse.clicks
--                         ]
--                         ++ Signal.map
--                             (\( x, y ) _ t_ state ->
--                                 let
--                                     pos =
--                                         ( toFloat (x1 + x), toFloat (y2 - y) )
--                                 in
--                                 ( t_, { state | mousePos = pos, s = upd NoEvent pos t_ state.s } )
--                             )
--                             Mouse.position
--                         :: extra_sigs


type alias Picture =
    Collage.Form


circle : Float -> Picture
circle =
    circle_ Collage.defaultLine


circle_ : LineStyle -> Float -> Picture
circle_ s r =
    Collage.outlined s <|
        Collage.circle r


filledCircle : Color -> Float -> Picture
filledCircle c r =
    Collage.filled c <|
        Collage.circle r


rectangle : ( Float, Float ) -> Picture
rectangle =
    rectangle_ Collage.defaultLine


rectangle_ : LineStyle -> ( Float, Float ) -> Picture
rectangle_ s ( x, y ) =
    Collage.outlined s <|
        Collage.rect x y


filledRectangle : Color -> ( Float, Float ) -> Picture
filledRectangle c ( x, y ) =
    Collage.filled c <|
        Collage.rect x y


segment : ( Float, Float ) -> ( Float, Float ) -> Picture
segment p1 p2 =
    path [ p1, p2 ]


path : List ( Float, Float ) -> Picture
path =
    path_ Collage.defaultLine


path_ : LineStyle -> List ( Float, Float ) -> Picture
path_ s ps =
    Collage.traced s <|
        Collage.path ps


oval : ( Float, Float ) -> Picture
oval =
    oval_ Collage.defaultLine


oval_ : LineStyle -> ( Float, Float ) -> Picture
oval_ s ( x, y ) =
    Collage.outlined s <|
        Collage.oval x y


square : Float -> Picture
square =
    square_ Collage.defaultLine


square_ : LineStyle -> Float -> Picture
square_ s a =
    Collage.outlined s <|
        Collage.square a


type alias Color =
    Color.Color


ngon : Float -> Float -> Picture
ngon =
    ngon_ black


ngon_ : Color -> Float -> Float -> Picture
ngon_ c n r =
    Collage.rotate (pi / 2) <|
        Collage.filled c <|
            Collage.ngon (floor n) r


polygon : List ( Float, Float ) -> Picture
polygon =
    polygon_ Collage.defaultLine


polygon_ : LineStyle -> List ( Float, Float ) -> Picture
polygon_ s ps =
    Collage.outlined s <|
        Collage.polygon ps


text : String -> Picture
text s =
    Collage.text <|
        Text.fromString s


move : ( Float, Float ) -> Picture -> Picture
move =
    Collage.move


group : List Picture -> Picture
group =
    Collage.group


scale : Float -> Picture -> Picture
scale x f =
    Collage.scale x <|
        Collage.group [ f ]


rotate : Float -> Picture -> Picture
rotate a f =
    Collage.rotate a <|
        Collage.group [ f ]


alpha : Float -> Picture -> Picture
alpha =
    Collage.alpha


type alias LineStyle =
    Collage.LineStyle


solid : Color -> LineStyle
solid =
    Collage.solid


dashed : Color -> LineStyle
dashed =
    Collage.dashed


dotted : Color -> LineStyle
dotted =
    Collage.dotted


red : Color
red =
    Color.red


orange : Color
orange =
    Color.orange


yellow : Color
yellow =
    Color.yellow


green : Color
green =
    Color.green


blue : Color
blue =
    Color.blue


purple : Color
purple =
    Color.purple


brown : Color
brown =
    Color.brown


white : Color
white =
    Color.white


black : Color
black =
    Color.black


rgb : Int -> Int -> Int -> Color
rgb r g b =
    Color.rgb r g b


image : ( Float, Float ) -> String -> Picture
image ( x, y ) s =
    Collage.toForm <|
        Element.image (round x) (round y) s


empty : Picture
empty =
    Collage.toForm Element.empty



-- icon : Float -> (Color -> Int -> Html.Html) -> Picture
-- icon =
--     icon_ black
--
--
-- icon_ : Color -> Float -> (Color -> Int -> Html.Html) -> Picture
-- icon_ c s i =
--     let
--         s_ =
--             round s
--     in
--     Collage.toForm <|
--         Html.toElement s_ s_ <|
--             i c s_
