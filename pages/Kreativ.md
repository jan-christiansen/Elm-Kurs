[Zur�ck](Bouncing.md)

---

# Siebte Aufgabe

Ver�ndere folgendes Programm:

```elm
import List

list =
  [ (circle 10, 0)
  , (square 15, pi/2)
  , (circle 10, pi)
  , (square 15, 1.5*pi)
  ]

scene (x,y) t =
  let
    fun i (form, alpha) =
      let
        (a,b) = (120 * cos(alpha + t/1.5), 120 * sin(alpha + t/1.5))
        image = group [form, text (toString i)]
      in
        image |> move (a,b)
  in
    group (List.indexedMap (fun << toFloat) list)

main = display (400,300) scene (Just (FPS 50))
```

so dass interessantes, von sowohl der Mausbewegung als auch der Zeit abh�ngiges Verhalten entsteht.
Zum Beispiel [so etwas](http://jvoigtlaender.github.io/Elm-Kurs/riegel-campus-2015/Kreativ.html).

[Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/riegel-campus-2015/task-files/Playground7.elm)

Der Kreativit�t freien Lauf!

---

Beispielausdr�cke zur Erinnerung:

* `rectangle (30,20)`
* `path [ (0,0), (15,15), (30,-15), (40,5) ]`
* `circle' (dashed red) r |> move (x,y)`
* `if ... then ... else ...`

---

[Zusatz](Fraktal.md)

