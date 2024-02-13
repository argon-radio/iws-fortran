# Building Exercise

In dieser Aufgabe soll das Aufrufen des Compilers und seiner verschiedenen Optionen durchgeführt werden.
Alle hier verwendeten Optionen sind im [Cheat-Sheet](../Cheat-Sheets/building.md) für Building aufgelistet.

## 1 Einfache Compiler-Aufrufe

Erstelle ein einfaches "Hello, World!"-Programm und kompiliere es mit der Compiler-Option `-v`:

```sh
gfortran -v hello.f90
```

Quell-Code Beispiel für "Hello, World!":

```f90
program hello
   intrinsic none
   print *, "Hello, World!"
end program hello
```

_Optional: Lasse dir mit der Option `-S` die Assembly erzeugen und schau sie dir an._

Nun erzeuge nur die Objekt-Datei `hello.o` und versuche sie auszuführen.
Was wird auf der Konsole ausgegeben? Falls ein Berechtigungsfehler auftritt, muss die Datei noch als ausführbar markiert werden, z.B. mit dem Befehl: `chmod 755 hello.o`.

Lasse dir nun mit dem Befehl `file` die Dateiinformationen von `hello.o` und dem am Anfang kompilierten `a.out` anzeigen und vergleiche sie.

## 2 Mehr als ein Source-File

Erzeuge nun ein Modul in einer zweiten Quellcodedatei `lib.f90`, welches eine beliebige Prozedur, z.B. eine Subroutine mit einem `print`-Statement oder einer Berechnung, enthält.
Binde das Modul in vorher erzeugte Programm "hello" ein und rufe die Subroutine darin auf.
Am einfachsten übergibt man beide Quellcodedateien direkt dem Compiler:

```sh
gfrotran hello.f90 lib.f90
```

Nun erzeuge aus alle Quellcodedateien zunächst Objekte und Linke diese anschließend (geht alles mit `gfortran`).

Schaue dir zuletzt mit dem Befehl `ldd` die Bibliotheken an, die dein erzeugtes Programm `a.out` benötigt.
Merke dir diese Ausgabe für die nächste Aufgabe

## 3 Eigene Bibliotheken

Optional kannst du nun ein weiteres Modul in einer dritten Datei anlegen.

### Statische Bibliothek

Nehme nun deine Module und erzeuge aus ihnen eine statische Bibliothek, indem du sie erst zu Objekten kompilierst und anschließend in einem Archiv zusammenfasst.
Die notwendigen Befehle hierfür findest du ebenfalls im [Cheat-Sheet](../Cheat-Sheets/building.md) für Building.

Anschließend kann die Bibliothek zusammen mit `hello.f90` beim Kompilieren verwendet werden.

### Dynamische Bibliotheken

Erzeuge nun aus deinen Modulen eine dynamische Bibliothek und kompiliere dein `hello.f90` zusammen mit ihr.
Führe das Programm noch nicht aus, sondern schaue dir zunächst wieder mit `ldd` die von diesem Programm benötigten Bibliotheken an.
Es sollte nun eine neue Bibliothek in deinem Arbeitsverzeichnis referenziert werden.
Wenn du nun versuchst, das Programm auszuführen, wird es eine Fehlermeldung geben, da deine Bibliothek nicht gefunden wurde.
Das liegt daran, dass sie nicht einem Standard-Verzeichnis für Bibliotheken liegt.
Wir könne unser Arbeitsverzeichnis allerdings einfach zu den aktuellen Umgebungsvariablen hinzufügen:

```sh
export LD_LIBRARY_PATH="/path/to/libdir:$LD_LIBRARY_PATH" #/path/to/libdir muss an dein Verzeichnis angepasst werden
# bzw.
export LD_LIBRARY_PATH="$(pwd):$LD_LIBRARY_PATH"
```

Anschließend kann das Programm normal ausgeführt werden.
