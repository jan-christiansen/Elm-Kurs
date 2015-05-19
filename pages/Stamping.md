[Zur�ck](Mario.md)

---

# Zehnte Aufgabe

Jetzt wollen wir [dies](http://jvoigtlaender.github.io/Elm-Kurs/examples/Stamping.html) umsetzen. (Bewege die Maus und klicke ein paar Mal.)

Als Zustand bietet sich eine Liste von schon "gestempelten" Teilbildern an. Listen hatten wir bisher als Argumente f�r `group`. Sie lassen sich aber auch unabh�ngig davon anlegen und verwenden.

Ver�ndere die `update`-Funktion in folgendem Programm:

```elm
import Color exposing (..)

type alias State = List Picture

initial : State
initial = []

update : Event -> (Float,Float) -> Float -> State -> State
update event (x,y) _ list = list

scene : (Float,Float) -> Float -> State -> Picture
scene (x,y) _ list =
  group
  (list ++ [ ngon' red 5 15 |> move (x,y) ])

main = displayWithState (-200,-150) (200,150) scene initial update Nothing
```

so dass das gew�nschte Verhalten entsteht.

<!--
[Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/Playground10.elm)
-->

Hilfestellungen:

* `[]` steht f�r eine leere Liste, wohingegen `++` die Erweiterung einer Liste (oder allgemein das Aneinanderh�ngen zweier Listen) erm�glicht.

* In `update` und `scene` kann, und hier sollte, �ber das entsprechende Argument auf die aktuelle Mausposition zugegriffen werden.

* Um auf Mausklicks zu reagieren, existiert der Ereignisname `Click`.

---

[Zusatz](Fraktal.md)
