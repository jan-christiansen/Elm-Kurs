[Zurück](ColoredCircles.md)

---

# Mausbewegung

Als nächstes sollen Sie die Graphiken erzeugen, die abhängig von der aktuellen Position der Maus sind.
Um eine solche Anwendung zu schreiben, verwenden Sie die Funktion `displayWithMouse` an Stelle von `display`.
Wenn wir diese Funktion nutzen, erhält die Szene nun in `x` und `y` immer die Koordinaten der jeweils aktuellen Mausposition.
Das gezeichnete Bild ist also nicht mehr statisch, sondern kann auf Mausbewegungen reagieren.

```elm
scene ( x, y ) =
    .. abhängig von der Mausposition (x, y)


main =
    displayWithMouse scene
```

---

[Weiter](Mouse.md)
