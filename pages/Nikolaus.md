[Zurück](Start.md)

---

# Erste Aufgabe

Vervollständigen Sie die Datei `Nikolaus.elm` so, dass das Haus des Nikolaus gezeichnet wird.

```elm
scene =
    group [ cross, rectangle ( 100, 130 ) ]


cross =
    segment ( -50, -65 ) ( 50, 65 )


main =
    display scene
```

Das Ergebnis soll etwa wie folgt aussehen.

![Haus des Nikolaus](../images/Nikolaus.png)

[Datei](https://raw.githubusercontent.com/jan-christiansen/Elm-Kurs/master/src/task01/Nikolaus.elm)

---

[Weiter](Forms.md)
