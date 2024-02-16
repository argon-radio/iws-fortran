# Determinanten bestimmen

Zweck dieser Übung ist es, die Notation und Syntax von Fortran bezüglich Module und 
Prozeduren anzuwenden, um eine Grundlage für den weiteren Workshop zu schaffen.

In dieser Übung sollt ihr zwei Prozeduren entwickeln, die die Determinante einer 
übergebenen Matrix berechnet. Dabei wird sich auf quadratische Matrizen der Form 
(3,3), also 3 Zeilen und 3 Spalten, beschränkt.

1) Schreibt eine Subroutine, die die Determinante einer solchen Matrix errechnet 
und sie direkt auf der Konsole ausgibt. Im Hauptprogramm soll dann die Subroutine aufgerufen werden.
2) Schreibt eine Funktion, die dasselbe tut, allerdings nicht das Ergebnis ausgibt, 
sondern es als Ergebniswert zurückliefert. Im Hauptprogramm soll dannn das Ergebnis ausgegeben werden.

Tipps:
- Platziert beide Prozeduren in einem Modul, das dann im Hauptprogramm eingebunden wird 
- die Determinante einer 3,3-Matrix, die spaltenweise die Werte 1 - 9 enthält, ist 0. Damit könnt 
ihr überprüfen, ob ihr richtig rechnet.
- Überlegt euch, welche dummy-Variablen ihr für die Funktionen braucht. Die Matrix selbst wird nicht genügen.
- Die Determinante einer 3,3-Matrix berechnet sich wie folgt:

```txt
         |a b c|
det(M) = |d e f| = aei + bfg + cdh - ceg - bdi - afh 
         |g h i|
```
