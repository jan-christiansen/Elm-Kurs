[Zurück](Re-Use.md)

---

# Fünfte Aufgabe

Ändern Sie Ihr Programm jetzt so ab, dass zehn Kreise mit unterschiedlichen Durchmessern gezeichnet werden.
Das heißt, das Programm soll die folgende Anzeige erzeugen.

![Farbige Kreise](../images/Kreise.png)

Passe die Datei `Circles.elm` so an, dass zehn Quadrate mit den Größen `10`, `20`, ..., `100` gezeichnet werden.

```elm
pic i =
    square (10 * i)


scene =
    group []


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
