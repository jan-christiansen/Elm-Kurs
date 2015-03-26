[Zur�ck](Re-Use.md)

---

# Dritte Aufgabe

Passe so an, dass von den 10 konzentrischen Kreisen die inneren f�nf rot, die �u�eren f�nf gr�n sind:

```elm
form i =
  circle (10 * i)

scene _ _ =
  group
  [ form 1
  , form 2
  , form 3
  , form 4
  , form 5
  , form 6
  , form 7
  , form 8
  , form 9
  , form 10
  ]

main = display (400,300) scene Nothing
```

[Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/riegel-campus-2015/task-files/Playground3.elm), [@share-elm](http://share-elm.com/sprout/550dbcdce4b0d720e25d6503/0.14/view)

Hinweise:

* Von den Funktionen `rectangle`, `square`, `circle`, `oval`, `path` gibt es Varianten, die uns das Aussehen der gezeichneten Linien ver�ndern lassen.
  W�hrend zum Beispiel `rectangle' (solid black) (30,20)` �quivalent zum schon gesehenen `rectangle (30,20)` ist, geht auch `rectangle' (dashed red) (30,20)`:  
  ![rectangle'](../images/rectangle'.png)  
  oder auch etwa `oval' (dotted blue) (30,20)`:  
  ![oval'](../images/oval'.png)  
  Eine �bersicht vorhandener Farben und M�glichkeiten zur Erzeugung neuer findet man bei Bedarf [hier](http://package.elm-lang.org/packages/elm-lang/core/1.1.1/Color).

* Um abh�ngig von irgendeiner Bedingung verschiedene Ergebnisse (zum Beispiel einer Funktion wie `form i = ...`) zu liefern, l�sst sich `if ... then ... else ...` verwenden.

Zielbild:

![Farbige Kreise](../images/Kreise.png)

---

[Weiter](Maus.md)

