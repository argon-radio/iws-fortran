# Größter gemeinsamer Teiler nach Euklid

Zeil dieser Aufgabe ist es eine Funktion zu schreiben, die den größten gemeinsamen Teiler zweier natürlicher Zahlen nach Euklid ermittelt.

Dieser Algorithmus arbeitet wie folgt:
Aus zwei unterschiedlich große Zahlen _a_ und _b_ wird die größere ermittelt und durch den Rest beim Teilen der größeren durch die kleinere ersetzt.
Dies wird solange wiederholt, bis der Rest der Division 0 ist.
Die übrige Zahl ist der größte gemeinsame Teiler.

Beispiel für die Zahlen 20 und 45:

```txt
(20, 45) --> (20, 45 mod 20)=(20, 5)
(5, 20) --> (5, 20 mod 5)=(5, 0)
```

Somit ist 5 der größte gemeinsame Teiler von 20 und 45.

Diese Aufgabe kann sowohl rekursiv als auch iterativ gelöst werden.
