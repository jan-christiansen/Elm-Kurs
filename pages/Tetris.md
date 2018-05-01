[Zurück](ComplexState.md)

---

# Elfte Aufgabe

Vervollständigen Sie das Programm `Block.elm`, so dass Sie den Block mit den Pfeiltasten in geeignet großen Schritten bewegt werden können.
Ersetzen Sie das Quadrat außerdem durch einen Block mit dem folgenden Aussehen.
![Block]((../images/block.png)

Als nächstes sollen Sie den gezeichneten Block mit Hilfe der Leertaste drehen.
Das Event für die Leertaste lautet `Space`.
Außerdem gibt es eine Funktion `rotate`, die eine Graphik erhält und einen Winkel und die Graphic rotiert.
Der Winkel wird dabei in Radiant angegeben.

Um den Block zu drehen, benötigen wir einen Zustand, der zusätzliche Informationen enthält.
Genauer gesagt, müssen Sie wissen, um wie viel Grad Ihr Block aktuell gedreht ist.
Erweitern Sie das Paar zu einem Tripel.
Die dritte Komponente gibt an, um wie viel Grad der Block gedreht ist.
Überlegen Sie sich, wie die Gradzahl geändert werden muss, wenn die Leertaste gedrückt wird.

[Datei](https://raw.githubusercontent.com/jan-christiansen/Elm-Kurs/master/src/task11/Tetris.elm)

---

[Weiter](Tetris.md)
