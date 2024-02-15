# Collective Subroutines Übungsaufgabe

## Beschreibung
In dieser Aufgabe werden verschiedene Collective Subroutines ausprobiert.  
Es wird pro Image ein Vektor mit zufälligen Werten initialisiert. Von diesem Vektor werden mit `co_sum`, `co_min` und `co_max` Werte berechnet. Des Weiteren wird ein großer Vektor aus den Vektoren der einzelnen Images zusammengesetzt und auf alle Images mit `co_broadcast` geschrieben.

## Vorgehen

1. Deklaration der Variablen  
   - Ein Vektor  `vec` als Coarray mit einer beliebigen Dimension, z.B. 3
   - Die Vektoren `vec_sum`, `vec_min`, `vec_max` mit der selben Dimension wie `vec`
   - Ein allokierbarer Vektor `big_vec`
   - Eine Counter Variable für einen do-Loop

2. Allokation von `big_vec`  
   Allokiere `big_vec` mit der Dimension die sich aus der Anzahl der Images x Dimension von `vec` ergibt

3. Initialisierung von `vec`  
   Initialisiere `vec` indem dem Vektor zufällige Werte zugewiesen werden

4. Ausgabe des Initialisierten Vektors
   Gebe auf allen Images die nun initialisierten Werte von `vec` aus.

5. Initialisieren von der restlichen Vektoren  
   Initialisiere die Vektoren `vec_sum`, `vec_min`, `vec_max` indem du ihnen die Werte von `vec` zuweist

6. Collective subroutines ausführen  
   Auf allen Images werden nun die Subroutinen `co_sum`, `co_min` und `co_max` ausgeführt. Die Ergebnisse sollten jeweils in `vec_sum`, `vec_min` und `vec_max` gespeichert werden.

7. Ausgabe der Ergebnisse der Subroutinen  
   Auf dem ersten Image sollen die Ergebnisse des vorherigen Schritts ausgegeben werden. Es reicht aus dies auf dem ersten Image zu machen, da die Variablen auf allen Images die gleichen Werte haben sollten.

8. Zusammenfügen der Vektoren `big_vec`  
   Nun muss auf dem ersten Image durch alle Images iteriert werden.  
   Der Wert von `vec` im jeweiligen Image wird dann an der passenden Stelle in den Vektor `big_vec` geschrieben.  
   Dazu müssen die richtigen Indizes aus der Counter-Variable berechnet werden.
   Sie können mit `size(vec)*(i-1)+1` und `size(vec)*i` berechnet werden.

9. co_broadcast des Vektors `big_vec`  
   Der in Image 1 gefüllte Vektor `big_vec` muss nun auf alle anderen Images verteilt werden. Das wird mit dem Aufruf von `co_broadcast` gemacht.

10. Ausgabe des Ergebnisses  

11. Deallokation von `big_vec`  
   Der Speicher der allokierten Variablen muss nun wieder freigegeben werden.

## Ausgabe

```
 Image           1  0.678559244       1.43632889E-02  0.926992893   
 Image           2  0.843747497      0.456833959      0.110796630     
 Image           3  0.975341380      0.260654867      0.806611836   
 co_sum   2.49764800      0.731852114       1.84440136    
 co_min  0.678559244       1.43632889E-02  0.110796630    
 co_max  0.975341380      0.456833959      0.926992893    
 big_vec  0.678559244       1.43632889E-02  0.926992893      0.843747497      0.456833959      0.110796630      0.975341380      0.260654867      0.806611836    
 big_vec  0.678559244       1.43632889E-02  0.926992893      0.843747497      0.456833959      0.110796630      0.975341380      0.260654867      0.806611836     
 big_vec  0.678559244       1.43632889E-02  0.926992893      0.843747497      0.456833959      0.110796630      0.975341380      0.260654867      0.806611836
```