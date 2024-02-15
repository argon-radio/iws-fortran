# Wochentag

Ziel dieser Aufgabe ist die Bestimmung des Wochentags an einem gegebenen Datum mithilfe einer Funktion.
Bekannt ist hierfür der Algorithmus von Gauß, der die Berechnung des Wochentags nach dem Gregorianischen Kalender ermöglicht und dabei jedem Wochentag eine Zahl zuordnet.
Für diese Aufgabe nutzen wir eine Abgewandelte Version, die auch über das Jahr 2100 hinaus korrekte Werte liefert und die Zahlen 0 dem Samstag bis 6 dem Freitag zuordnet.

Bei gegebenen Datum mit d (Tag), m (Monat) und y (Jahr) erfolgt die Berechnung folgendermaßen:

```txt
Tag der Woche = (d + ((m+1)*26)/10 + k + k/4 + j/4 + 5*j) % 7
mit
m = m + 12 und y = y - 1, für m < 2
j = y / 100
k = y mod 100
```
