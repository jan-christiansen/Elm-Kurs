[Zurück](Squares.md)

---

# Funktionen

Das Beispiel mit den Quadraten ist sehr unflexibel.
Wenn wir zum Beispiel statt zehn Quadrate, zehn Kreise zeichnen möchten, müssen wir alle Aufrufe von `square` durch `circle` ersetzen.
Wenn alle Quadrate die gleiche Größe hätten, könnten wir einfach einen Namen für ein Quadrat einführen und müssen dann nur einen Aufruf von `square` durch einen Aufruf von `circle` ersetzen.
In unserem Beispiel möchten, wir aber, dass die Quadrate unterschiedliche Größen haben.
Um dieses Beispiel umzusetzen, können wir eine Funktion verwenden.
Eine Funktion kann zusätzliche Informationen als Argument erhalten.
Wir können zum Beispiel die folgende Funktion definieren.
```elm
pic i =
    square (10 * i)
```
Wenn wir `pic 6` verwenden, erhalten wir dafür `square 60`.

---

[Weiter](Circles.md)
