[Zurück](Collisions.md)

---

# Fünfzehnte Aufgabe

In dieser Aufgabe sollen Sie Ihr Snake-Spiel um Futter für die Schlange erweitern.
Zeichnen Sie dazu an einer Position des Spielfeldes ein rotes Quadrat der Größe `(20, 20)`.
Wenn die Schlange auf dieses Feld läuft, soll das Futter verschwinden und an einer andere Stelle auftauchen.

Um das Erscheinen des Futters an einer anderen Stelle zu modellieren, können Sie die Bibliothek unter [Random](http://package.elm-lang.org/packages/elm-lang/core/latest/Random) nutzen.
Zuerst müssen Sie einen `Generator` definieren, der eine zufällige Position innerhalb des Spielfeldes generiert.
Den Generator können Sie mit Hilfe der Funktion `step` nutzen, um einen neuen Wert zu generieren.
Die Funktion `step` nimmt dabei neben dem Generator noch einen sogenannten _seed_.
Dieser wird genutzt, um ein pseudo zufälliges Verhalten zu erzeugen.

---

[Weiter](End.md)
