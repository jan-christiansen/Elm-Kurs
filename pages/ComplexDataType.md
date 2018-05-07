[Zurück](ComplexState.md)

---

# Komplexe Datentypen

Die beiden Varianten eines Datentypen können auch kombiniert werden.
Der folgende Datentyp beschreibt zum Beispiel zwei mögliche Fälle, die auftreten können.

```elm
type State
    = End
    | Running ( Float, Float ) Direction
```

Die folgende Funktion führt eine Fallunterscheidung über diesen beiden Fällen durch.

```elm
update : Event -> State -> State
update event s =
    case s of
        End ->
            End

        Running ( x, y ) dir ->
            case event of
                Tick ->
                    Running ( x + 1, y ) dir

                _ ->
                    Running ( x, y ) dir
```

---

[Weiter](SimpleSnake.md)
