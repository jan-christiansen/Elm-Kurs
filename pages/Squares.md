[Zurück](Re-Use.md)

---

# Dritte Aufgabe

Passe die Datei `Repeat.elm` so an, dass von den 10 konzentrischen Kreisen die inneren fünf rot, die äußeren fünf grün sind:

```elm
scene =
    group
        [ square 10
        , square 20
        , square 30
        , square 40
        , square 50
        , square 60
        , square 70
        , square 80
        , square 90
        , square 100
        ]


main =
    display scene
```


Das heißt, das Programm soll die folgende Anzeige erzeugen.

![Farbige Kreise](../images/Kreise.png)


Statt einzeln Kreise einzufärben, kann man, um flexiber zu sein eine Verzweigung verwenden, um, abhängig von einer Bedigung, verschiedene Ergebnisse zu liefern.
Der Ausdruck `if i == 1 then square 20 else circle 10` liefert zum Beispiel ein Quadrat, wenn `i` den Wert `1` hat und einen Kreis andernfalls.


---

[Weiter](Circles.md)

---

([Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/master/src/task03/Kreise.elm), [@share-elm](http://share-elm.com/sprout/55896f3fe4b06aacf0e8a75c/0.14/view))
