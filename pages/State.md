[Zurück](Pendulum.md)

---

Um komplexeres Verhalten zu beschreiben, ist es notwendig einen "gemerkten Zustand" zu verwenden.
Abhängig vom aktuellen Zustand kann die Anwendung dann ihre Anzeige anpassen.

Wir schauen uns zunächst ein recht einfaches Beispiel an.

```elm
initial =
    0


update event state =
    case event of
        Space ->
            state + 1

        _ ->
            state


scene state =
    text (toString state)


main =
    displayWithState initial scene update
```

Es gibt einige Dinge zu erklären:

* Wir müssen ausdrücken, was der "erinnerte Zustand" ganz am Anfang sein soll, wenn es noch gar keine zu erinnernde Vergangenheit gibt.
Da wir hier einen einfachen Zähler realisieren wollen, verwenden wir als initialen Zustand die Zahl `0`.

* Wir müssen ausdrücken, wie sich der Zustand (`state`) ändern soll, wenn ein Ereignis (`event`) eintritt.
Dies geschieht in der `update`-Funktion.
Sie führt mittels `case ... of ...` eine Fallunterscheidung auf dem Ereignis durch.
Hier wollen wir zunächst nur auf das Ereignis "Maustaste wurde gedrückt" (`Click`) reagieren.
Wenn die Maustaste gedrückt wurde, erhöhen wir den Zählerstand um `1`.

* Um auszudrücken, dass sich in jedem anderen Fall (also, falls die Maustaste nicht gedrückt wurde) der Zustand (also der Zähler) nicht ändern soll, verwenden wir die Zeile `_ -> state`.
Eine solche oder ähnliche Zeile sollte es im Folgenden in jeder Anwenung geben.

* In der `scene`-Funktion steht nun der jeweils aktuelle Zustand als weiteres Argument zur Verfügung und kann zur Berechnung der Ausgabe (also der zu erzeugenden Anzeige) verwendet werden.
Hier zeigen wir den aktuellen Zählerstand einfach nur an.

* Mittels der `displayWithState`-Funktion bringen wir schließlich alles zusammen.

---

[Weiter](Counter.md)
