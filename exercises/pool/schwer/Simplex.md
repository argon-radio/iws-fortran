# Der Simplex-Algorithmus

In dieser Aufgabe ist das Ziel, die grundlegenden Konstrukte einer turingmächtigen Programmiersprache, in diesem Falle natürlich Fortran, einzusetzen, um den Simplex Algorithmus zu implementieren.
Bitte beachtet, dass diese Aufgabe "schwer" ist, weil hierbei beinahe alle bisher besprochenen Konstrukte sinnvoll eingesetzt werden können - der Algorithmus selbst ist nicht schwer.

## Hintergrund

Der (primale) Simplex-Algorithmus ist die Basis einiger sehr effektiver Methoden zur Umsetzung der
mathematischen Optimierung, sprich der Lösung von sogenannten linearen Programmen. Diese Methoden werden
eingesetzt, um beispielsweise Transportnetzwerke, den Schienenverkehr (Graphenoptimierung), Produktionslosgrößen, Stundenpläne oder auch Ernährungspläne zu optimieren.
Lineare Programme sind definiert durch eine existierende lineare Zielfunktion der allgemeinen Form Z = c_1x_1+c_2x_2+...+c_nx_n. Dabei stellen die x-Werte Entscheidungen dar (zB kann x_n für die Quantität eines Produkt stehen, das produziert wird, oder auch nicht) und die Faktoren c_n Kosten der Entscheidung.
Es sollen nun Belegungen der x-Variablen gefunden werden, sodass der Zielfunktionswert Z möglichst groß wird (zB für das Ziel der Profitmaximierung in der Produktion von Gütern).
Die Ausprägungen der x-Variablen wird allerdings durch Nebenbedingungen eingeschränkt, da bspw. eine Maschine, die benötigt wird, eine gewisse Laufzeit hat, in der sie produziert und somit nicht mehr beladen werden kann. Im Standardfall wird die Kleiner-Gleich-Relation für Nebenbedingungen verwendet.

## Der Algorithmus

Gegeben ist eine Matrix "Tableau" mit n Spalten und m Zeilen. Eine Zeile repräsentiert eine lineare Gleichung, ergo repräsentieren die Spalten die Ausprägungen der Variablen x_n. Die rechteste Spalte einer Zeile repräsentiert die Nebenbedingung für die lineare Gleichung. Zum Beispiel:

```txt
1 5 3 1 0 0 17 => 1 * x + 5 * y + 3 * z + 1 * a + 0 * b + 0 * c <= 17
```

Die unterste Zeile repräsentiert die Zielfunktion. Da die Zielfunktion keine Nebenbedingung hat, spiegelt der rechteste unterste Wert den Wert der Zielfunktion ab.

Der Algorithmus läuft nun wie folgt ab:

1) Finde den größten Wert in der untersten Zeile des Tableaus und merke dir die Spaltennummer als ``p_col`` (für "Pivotspalte").

2) Ohne sie zu überschreiben, teile alle Werte der rechtesten Spalte durch den in derselben Zeile liegenden Wert der Spalte ``p_col``.
Merke dir diese Werte als Array ``tmp``

3) Der Index des kleinsten Wertes in ``tmp`` bestimmt die Pivotzeile ``p_row``

4) Dividiere die gesamte Pivotzeile ``p_row`` durch sich selbst, damit der Kreuzungspunkt der Pivotspalte und der Pivotzeile (="Pivotelement") 1 wird.

5) Iteriere nun alle Zeilen des Tableaus mit Ausnahme der Pivotzeile (if (currentRow == p_col) cycle) solange bis in der untersten Zeile nur noch Werte <= 0 übrig sind:

  - Ist in einer Zeile in Spalte ``p_col`` der Wert 0, überspringe diese Zeile
  - Merke dir den Wert der aktuellen Zeile in Spalte ``p_col`` als bspw. ``p_col_val``
  - Für alle Spalten ``i`` der aktuellen Zeile: subtrahiere das ``p_col_val``-fache von ``p_row`` in Spalte ``i`` von Zeile ``p_row`` in Spalte ``p_col``

6) Erstelle ein Lösungsarray ``results``, das so viele Indizes hat, wie es Spalten im Tableau gibt

6) Betrachte alle Spalten ``j`` außer der rechtesten und jeweils ohne die unterste Zeile: Stehen hier ausschließlich Nullen und exakt eine 1? Ja: - merke dir diejenige Zeile ``i`` der Spalte ``j``, in der die 1 steht und speichere den Wert des Tableaus in Zeile ``i`` der rechtesten Spalte in ``results(j)``. Nein: - speichere eine 0 in ``results(j)``

7) Speichere den Wert in der untersten Zeile und der rechtesten Spalte in der letzten Stelle von ``results``
