[Zurück](ColoredSquares.md)

---

# Funktionen

Das Beispiel mit den Quadraten ist sehr unflexibel.
Wenn wir zum Beispiel statt zehn Quadrate zehn Kreise zeichnen möchten, müssen wir alle Aufrufe von `square` durch `circle` ersetzen.
Wenn alle Quadrate die gleiche Größe hätten, könnten wir wie beim Haus des Nikolaus einfach einen Namen für ein Quadrat einführen.
Wir müssten in dieser Definition dann nur einen Aufruf von `square` durch einen Aufruf von `circle` ersetzen.
In unserem Beispiel möchten wir aber, dass die Quadrate unterschiedliche Größen haben.
Um dieses Beispiel umzusetzen, können wir eine Funktion verwenden.
Eine Funktion kann zusätzliche Informationen als Argument erhalten.
Wir können zum Beispiel die folgende Funktion definieren.

```elm
pic i =
    square (10 * i)
```
Wenn wir `pic 6` verwenden, erhalten wir dafür zum Beispiel das gleiche Bild wie für den Aufruf `square 60`.

---

[Weiter](Squares.md)
