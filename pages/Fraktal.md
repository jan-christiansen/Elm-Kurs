[Zur�ck](Kreativ.md)

---

# Zusatzaufgabe(n)

Vervollst�ndige folgendes Programm:

```elm
scene _ _ =
  group
  [ sierpinski 4 ]

sierpinski i = 
  if i > 0
    then
      let 
        s = group
            [ sierpinski (i-1) ]
            |> scale 0.5
      in
        ...
    else
      ngon 3 120

main = display (400,300) scene Nothing
```

so dass `sierpinski i` jeweils die `i`. Stufe des [Sierpinski-Dreiecks](http://de.wikipedia.org/wiki/Sierpinski-Dreieck) darstellt, wobei der Umkreisradius des Gesamtdreiecks gleich `120` sein soll.

[Datei](https://raw.githubusercontent.com/jvoigtlaender/Elm-Kurs/riegel-campus-2015/task-files/Playgroundx.elm), [@share-elm](http://share-elm.com/sprout/550dbf27e4b0d720e25d650f/0.14/view)

Hinweise:

* Der Ausdruck `ngon 3 120` beschreibt die (ausgef�llte) Fl�che eines regelm��igen `3`-Ecks mit Umkreisradius `120`.

* Analog zu `|> move ...` wirkt `|> scale ...` auf ein beliebiges Teilbild, verschiebt dieses jedoch nicht, sondern streckt/staucht es.

* Die Beziehung zwischen Seitenl�nge `a` und Umkreisradius `r` in einem gleichseitigen Dreieck betr�gt `a = r * sqrt(3)`. Au�erdem gilt, dass der Inkreisradius halb so gro� wie der Umkreisradius ist.

Zielbild, f�r `i = 4`:

![Sierpinski-Dreieck](../images/Sierpinski.png)

Zusatz: Setze eine andere fraktale Darstellung um. Als Inspiration mag [dies hier](http://jvoigtlaender.github.io/Elm-Kurs/riegel-campus-2015/DancingTree.html) dienen. N�tzlich ist als weitere "Bildmanipulation" neben `|> move ...` und `|> scale ...` auch noch `|> rotate ...`.

