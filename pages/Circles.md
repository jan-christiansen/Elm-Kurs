[Zurück](Re-Use.md)

---

# Dritte Aufgabe

Passe die Datei `Circles.elm` so an, dass von den 10 konzentrischen Kreisen die inneren fünf rot, die äußeren fünf grün sind:

```elm
pic i =
    circle (10 * i)


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
```


Das heißt, das Programm soll die folgende Anzeige erzeugen.

![Farbige Kreise](../images/Kreise.png)


Statt einzeln Kreise einzufärben, kann man, um flexiber zu sein eine Verzweigung verwenden, um, abhängig von einer Bedigung, verschiedene Ergebnisse zu liefern.
Der Ausdruck `if i == 1 then square 20 else circle 10` liefert zum Beispiel ein Quadrat, wenn `i` den Wert `1` hat und einen Kreis andernfalls.


---

[Weiter](Maus.md)

---

([Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/task03/Kreise.elm), [@share-elm](http://share-elm.com/sprout/55896f3fe4b06aacf0e8a75c/0.14/view))
