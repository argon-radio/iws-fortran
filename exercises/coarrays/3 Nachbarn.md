# Nachbarn

## Beschreibung
In dieser Aufgabe geht es darum je Image einen Wert anhand der Benachbarten Images zu berechnen.
Dazu wird auf jedem Image eine zufällige Zahl generiert. Dann wird die Summe der zufälligen Werte der benachbarten Images berechnet. Also auf Image 2 ergibt sich der Wert aus der Summe der Zufallsvariable aus Image 1 und 3. Die Ergebnisse sollen dann für jedes Image ausgegeben werden.

## Vorgehen
1. Deklaration der Variablen  
   Es werden Folgende Variablen benötigt, welche davon Coarrays sind, müsst ihr selbst überlegen:
   - Zufallsvariable vom Typ `real`
   - Summe der Nachbarn vom Typ `real`
   - Jeweils Index des linken und rechten Images
   - (optional) Eine Counter Variable

2. Initialisieren der Zufallsvariable  
   Auf jedem Image muss die Zufallsvariable initialisiert werden.

3. Abspeichern des Indexes des linken und rechten Nachbarn  
   Für Image n:  
   - links = n - 1, falls erstes Image: n
   - rechts = n + 1, falls letztes Image: 1

4. Berechnen der Summe  
   Diese wird aus den Zufallsvariablen der benachbarten Images berechnet.

5. Ausgabe des Ergebnisses  
   Es sollten jeweils die Nachbarn des Images, als auch die Zufallsvariablen der Nachbarn und die daraus berechnete Summe Ausgegeben werden.

Tipps:  
- An einer Stelle solltet ihr die Images synchronisieren  
- Zufallszahlen kann man mit `rand_number()` generieren

## Ausgabe
```
Image           1
Nachbarn           4           2
Zufallsvariable links  0.589953005     rechts  0.407994449    
Summe  0.997947454    

Image           2
Nachbarn           1           3
Zufallsvariable links  0.462487280     rechts  0.266049981    
Summe  0.728537261    

Image           3
Nachbarn           2           4
Zufallsvariable links  0.407994449     rechts  0.589953005    
Summe  0.997947454    

Image           4
Nachbarn           3           1
Zufallsvariable links  0.266049981     rechts  0.462487280    
Summe  0.728537261
```