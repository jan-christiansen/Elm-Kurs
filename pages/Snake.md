[Zurück](Lists.md)

---

# Dreizehnte Aufgabe

In dieser Aufgabe sollen Sie die Anwendung um mehrere Positionen für die Schlange erweitern.
Verwenden Sie dazu den folgenden Datentyp.

```elm
type State
    = End
    | Running ( Float, Float ) (List ( Float, Float )) Direction
```

Eine Schlange besteht hierbei aus der Koordinate, an der der Kopf der Schlange steht und den Koordinaten der restlichen Schlangenelemente.

---

[Weiter](Collisions.md)
