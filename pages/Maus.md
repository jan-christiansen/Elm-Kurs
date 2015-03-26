[Zur�ck](Kreise.md)

---

# Vierte Aufgabe

Vervollst�ndige nun so, dass immer genau die Kreise rot sind, die n�her am Koordinatenursprung sind als der Mauszeiger (und die anderen gr�n):

```elm
form (x,y) i =
  let
    r = 10 * i
  in
    ...

scene (x,y) _ =
  group
  [ form (x,y) 1
  , form (x,y) 2
  , form (x,y) 3
  , form (x,y) 4
  , form (x,y) 5
  , form (x,y) 6
  , form (x,y) 7
  , form (x,y) 8
  , form (x,y) 9
  , form (x,y) 10
  ]

main = display (400,300) scene Nothing
```

[Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/riegel-campus-2015/task-files/Playground4.elm), [@share-elm](http://share-elm.com/sprout/550dbd8ce4b0d720e25d6506/0.14/view)

Zus�tzlich zu den bisherigen M�glichkeiten stehen nun in `x` und `y` immer die Koordinaten der jeweils aktuellen Mausposition zur Verf�gung.
Das gezeichnete Bild ist also nicht mehr statisch, sondern reagiert auf Mausbewegungen.

Zielverhalten wie hier: [Reagieren auf Mausbewegungen](http://jvoigtlaender.github.io/Elm-Kurs/riegel-campus-2015/Kreise.html).

---

Beispielausdr�cke zur Erinnerung:

* `circle' (solid green) r`
* `if ... then ... else ...`

---

[Weiter](Pendulum.md)

