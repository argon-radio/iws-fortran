# Zahlenratespiel

Ziel dieser Aufgabe ist es, ein Zahlenratespiel zu entwickeln. Dabei soll dem Rechner vom Nutzer mitgeteilt werden, wie viele Versuche der Spieler erhält.
Dafür soll eine Zufallszahl generiert werden, die anschließend geraten wird.
Die Grenzen, innerhalb welcher die Zahl generiert wird, soll ebenfalls vom Nutzer festgelegt werden können.
Der Spieler erhält eine Erfolgsmeldung, falls er die Zahl erraten hat und eine andere, sollte er es nicht in der angegebenen Anzahl an Versuchen schaffen, die Zahl zu erraten.

Diese Übung zielt darauf ab, die generelle Struktur und Syntax eines Fortran Programmes kennenzulernen.

Tipp: Zufallszahlen innerhalb der Grenzen ``low`` und ``high`` (beide inklusive) lassen sich folgendermaßen
generieren: ``low + floor((high + 1 - low) * rand)``
