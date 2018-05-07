[Zurück](ComplexState.md)

---

# Datentypen

Um die verschiedenen Fälle von Ereignissen zu unterscheiden, die bei einer Anwendung auftreten können, haben wir verschiedene Fälle eines Datentypen verwendet.
Diese Datentypen kann man auch in einem Programm definieren, um zu beschreiben, welche Fälle eine Variable annehmen kann.
Der folgende Datentyp stellt zum Beispiel eine Himmelsrichtung dar, die verschiedenen möglichen Werte für eine Himmelsrichtung aufgezählt werden.
Diese Form der Datentypen bezeichnet man auch als Aufzählungstypen.

```elm
type Direction
    = North
    | East
    | South
    | West
```

Wie wir für die verschiedenenen Formen von Ereignissen schon gesehen haben, kann man mit Hilfe des `case`-Konstruktes eine Fallunterscheidung über einen Aufzählungstyp durchführen.

Neben Datentypen, die einfach nur Möglichkeiten aufzählen, wie es bei `Direction` der Fall ist, kann man Datentypen auch nutzen, um mehrere Werte zusammenzufassen.
Diese Form der Datentypen funktioniert ähnlich wie ein Paar.

```elm
type State
    = Running ( Float, Float ) Direction
```

Diese Datentypen kann man mit Hilfe eines `case`-Konstruktes zerlegen.
Die folgende Funktion zerlegt zum Beispiel einen `State` in seine Komponenten, nämlich eine Koordinate und eine Richtung.
Das Ereignis `Tick` wird alle fünfzig Millisekunden ausgelöst.
Die folgende Funktion erhöht die `x`-Position also alle 50 Millisekunden um eins.

```elm
update : Event -> State -> State
update event (Running ( x, y ) dir) =
    case event of
        Tick ->
            Running ( x + 1, y ) dir


        _ ->
            Running ( x, y ) dir
```

---

[Weiter](Block.md)
