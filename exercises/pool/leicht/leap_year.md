# Schaltjahre

Ziel dieser Aufgabe ist die einfache Bestimmung, ob ein Jahr ein Schaltjahr ist.
Ein Schaltjahr nach dem gregorianischen Kalender ist prinzipiell ganzzahlig durch 4 teilbar.
Ausgenommen hiervon sind säkulare Jahre, also Jahre, die ein Jahrhundert abschließen (zb. 1900 oder 2000) und nicht ganzzahlig durch 400 teilbar sind.

```txt
istSchaltjahr = y mod 4,
wenn y mod 100 != 0
oder (y mod 400) = 0
```
