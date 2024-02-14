# Cäsar Chiffre

Ziel dieser Aufgabe ist es ein Modul zu schreiben, dass jeweils eine Prozedur zum verschlüsseln und entschlüsseln eines Textes mit der Cäsar-Chiffre enthält.

Mithilfe des Algorithmus werden Buchstaben des Alphabets anhand eines Schlüssels zur zyklischen Verschiebung auf andere Buchstaben desselben Alphabets abgebildet.
In unserem Fall umfasst das Alphabet 26 Buchstaben.

Die Berechnungen zur Verschlüsselung erfolgt daher so:

```txt
Be = (Bd + K) modulo 26
```

Analog erfolgt die Entschlüsselung durch Verschiebung in die entgegengesetzte Richtung:

```txt
Bd = (Be - K) modulo 26
```

_Tipp: Die intrinsischen Funktionen `achar`, `iachar` und `modulo` sind hierbei sehr hilfreich._
