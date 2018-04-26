[Zurück](Re-Use.md)

---

# Stile

Von den Funktionen `rectangle`, `square`, `circle`, `oval`, `segment` gibt es Varianten, bei denen man den Stil der gezeichneten Linie angeben kann.
Der Aufruf `rectangle' (solid black) ( 30, 20 )` erzeugt zum Beispiel das gleiche Bild wie `rectangle (30,20)`.
Der Aufruf `rectangle' (dashed red) (30,20)` liefert dagegen ![rectangle'](../images/rectangle'.png) und der Aufruf `oval' (dotted blue) (30,20)` liefert ![oval'](../images/oval'.png).
Die Farben `black`, `white`, `red`, `green`, `blue`, `yellow`, `orange`, `purple` und `brown` sind vordefiniert.
Mit der Funktion `rgb` können weitere Farben erzeugt werden.
Dabei erhält `rgb` die Werte für die drei Farben rot, grün und blau.
Die Werte müssen zwischen `0` und `254` liegen.
Der Aufruf `rgb 40 0 0` liefert zum Beispiel ein Rot.

---

[Weiter](ColoredSquares.md)
