[Zurück](MousePosition.md)

---

# Sechste Aufgabe

Vervollständigen Sie nun die Datei `Mouse.elm` so, dass immer genau die Kreise rot sind, die näher am Koordinatenursprung sind als der Mauszeiger.
Alle anderen färben Sie grün.

```elm
pic ( x, y ) i =
    let
        r =
            10 * i
    in
    empty


scene ( x, y ) =
    group
        [ pic ( x, y ) 1
        , pic ( x, y ) 2
        , pic ( x, y ) 3
        , pic ( x, y ) 4
        , pic ( x, y ) 5
        , pic ( x, y ) 6
        , pic ( x, y ) 7
        , pic ( x, y ) 8
        , pic ( x, y ) 9
        , pic ( x, y ) 10
        ]


main =
    displayWithMouse scene
```

Zus�tzlich zu den bisherigen M�glichkeiten stehen nun in `x` und `y` immer die Koordinaten der jeweils aktuellen Mausposition zur Verf�gung.
Das gezeichnete Bild ist also nicht mehr statisch, sondern reagiert auf Mausbewegungen.

Zielverhalten wie hier: [Reagieren auf Mausbewegungen](http://jvoigtlaender.github.io/Elm-Kurs/examples/Kreise.html).

---

Beispielausdr�cke zur Erinnerung:

* `circle' (solid green) r`
* `if ... then ... else ...`

---

[Weiter](MousePosition.md)

---

[Datei](https://raw.githubusercontent.com/jan-christiansen/Elm-Kurs/master/src/task06/Mouse.elm)
