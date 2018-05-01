[Zurück](Counter.md)

---

# Elfte Aufgabe

In der Regel benötigt man zur Modellierung des potentiell veränderlichen Zustands eines Systems oder Programms mehr als eine einzelne Zahl.
Das folgende Programm verwendet zum Beispiel zwei Zahlen als Zustand.

```elm
type alias State =
    ( Float, Float )


initial : State
initial =
    ( 0, 0 )


update : Event -> State -> State
update event ( x, y ) =
    case event of
        _ ->
            ( x, y )


scene : State -> Picture
scene ( x, y ) =
    square 40 |> move ( x, y )


main =
    displayWithState initial scene update
```

Zunächst wird der "Typ" `State` definiert.
Der Typ beschreibt, welche Form der Zustand der Anwendung hat.
In diesem Fall besteht ist der Zustand ein Paar von Fließkommazahlen.
Diese Paar werden wir gleich als Position in einem Koordinatensystem interpretieren.
In diesem Beispiel verwenden wir Typangaben, die wir bisher einfach weggelassen haben.
Typangaben können aber hilfreich sein, um ein Programm besser zu verstehen.

* Der Initialzustand muss von diesem Typ `State` sein, was durch `initial : State` beschrieben wird.

* Die Typangabe `update : Event -> State -> State` beschreibt, dass diese Funktion als Eingaben ein Ereignis und den erinnerten Zustand erhält, und als Ausgabe einen potentiell veränderten Zustand liefert.

* Schließlich ist auch eine Typangabe für `scene` möglich.
Diese Funktion nimmt den aktuellen Zustand, und liefert ein anzuzeigendes Bild.

---

[Weiter](Block.md)
