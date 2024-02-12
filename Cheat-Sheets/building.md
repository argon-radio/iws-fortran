# Building Programs

## GFortran Compiler Options

Option | Beschreibung
:--- | :---
-c | Compiliert den Quellcode ohne Linking-Schritt. Produziert Object-Datei `.o`
-o FILE | schreibt Output in Datei FILE
-S | Nur in Assembler Code übersetzen
-O, -O1 | Optimierung der Codegröße und Execution Time (bei schnellem Compilieren)
-O2 | Optimierung für sehr performanten Code, lange Compilier-Zeit
-O3 | Maximale Optimierung
-Os | Größenoptimierung des Codes
-O0 | Schnelle Compilier-Zeit, keine Optimierung, standardmäßig aktiv
-v | Gibt alle Schritte auf der Konsole aus
-shared | erzeugt ein Shared Object (Library)

## Erzeugen eigener Bibliotheken

Statische Bibliothek:

```sh
gfortran -c module1.f90 module2.f90 # usw.
ar r my.lib module1.o module2 # usw.
gfortran main.f90 my.lib # Nutzen der Bibliothek
```

Dynamische Bibliothek:

```sh
gfortran -shared -o mydyn.lib module1.f90 module2.f90
gfortran main.f90 mydyn.lib
```
