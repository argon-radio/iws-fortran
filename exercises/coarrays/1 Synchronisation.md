# Synchronisation

## Beschreibung
Diese Aufgabe soll verdeutlichen, wie Coarrays synchronisiert werden und warum es wichtig ist. Es wird eine Ausgabe erzeugt, die aufgrund fehlender Synchronisation eine falsche Ausgabe liefert. Danach wird diese Ausgabe mit Synchronisation wiederholt und verglichen.

Den Fehler `Coarrays disabled at (1), use '-fcoarray=' to enable` könnt ihr ignorieren.

## Vorgehen
1. Deklarieren der Variablen  
   - ein Coarray vom Typ Integer Skalar
   - eine Counter Variable für die Ausgabe

2. Simulieren, dass ein Image zu lange braucht  
   Damit wir eine fehlerhafte Ausgabe bekommen müssen wir ein Image solange pausieren, dass die anderen Images auf eine Variable dieses Images zugreifen, obwohl diese noch nicht initialisiert wurde.
   Welches Image pausiert wird ist egal, solange es nicht das erste ist.
   Man kann die Ausführung von Code mit der Funktion `sleep()` pausieren.
   Eine Sekunden sollte bereits reichen.

3. Initialisieren des Coarrays  
   Das Coarray sollte nun mit dem Index des momentanen Images initialisiert werden.

4. Ausgabe dass das Image fertig ist  
   Jedes Image sollte Text ausgeben, wenn es fertig ist mit der Initialisierung des Coarrays.

5. Ausgabe des Ergebnisses  
   Dieser Teil wird nur auf einem Image ausgeführt.
   Nun soll auf dem ersten Image durch alle Images iteriert werden und der Wert des Coarrays ausgegeben werden.
   Das führt zur folgenden Ausgabe:
```
Image           1 finished executing
Image           3 finished executing
Image            1 :            1
Image            2 :            0
Image            3 :            3
Image           2 finished executing
```

Wie zu sehen ist das Ergebnis beim 2. Image 0, obwohl sie 2 sein sollte.

6. Synchroniseren der Images  
   Die Images müssen nun an einer Stelle des Codes Synchronisiert werden, damit die Ausgabe des Ergebnisses erst passiert, wenn alle Images damit fertig sind, das Coarray zu initialisieren.
   Die Ausgabe sollte dann so aussehen:
```
Image           1 finished executing
Image           2 finished executing
Image           3 finished executing
Image            1 :            1
Image            2 :            2
Image            3 :            3
```
