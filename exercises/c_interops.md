# Exercise - Interoperabilität mit C

Ziel dieser Aufgaben ist es, C-interoperablen Code in Fortran zu schreiben.
Schaue dir auch die Beispiele im entsprechenden [Cheat-Sheet](../Cheat-Sheets/c_interoperability.md) an.

## 1 Fortran aufgerufen von C

Ziel der folgenden Übungen ist die Anwendung des Moduls `c_iso_binding`, um in Fortran geschriebene Prozeduren in C aufzurufen.

### 1.1 Subroutine ohne Argumente

Schreibe ein einfaches C-Hauptprogramm (`main.c`), das eine Fortran-Subroutine (`lib.f90`) ohne Argumente aufruft.
Beide Teile des C- und des Fortran-Programms sollten etwas auf der Konsole ausgeben, z.B. "Hello from C!" und "Hello from Fortran!".

_Tipp: Um keine Warnungen vom Compiler zu erhalten, sollte in C ein Function Prototype (Funktionsdeklaration ohne Rumpf) für die in Fortran geschriebene Subroutine definiert werden._

### 1.2 Subroutine mit Parameter (integer)

Nun modifiziere beide Programmteile so, dass die Fortran-Subroutine ein Parameter hat und C ein Argument übergibt.
Nutze hierfür zunächst den Datentyp `int` bzw. `integer`.
Passe zur Prüfung die entsprechenden Ausgaben so an, dass der übergebene Wert von Fortran auf der Konsole ausgegeben wird.

_Tipp: Setze zusätzlich das Attribut `value` für den Parameter der Subroutine._

### 1.3 Rückgabewert

In Fortran kann für jeden Parameter einer Prozedur (Subroutine und Funktion) bestimmt werden, ob dieser gelesen und geschrieben werden darf.
Verändere nun die Subroutine so, dass Fortran den Wert der übergebenen Variable verändert.
Übertrage so eine Änderung des Parameters an C und gebe ihn dort auf der Konsole aus.

_Tipp: Die Variable für den zu ändernden Wert muss in C angelegt und per Referenz an Fortran übergeben werden (`*` / `&`)._

#### 1.3.1 now with a Function

Ob Subroutinen oder Funktionen verwendet werden ist größtenteils abhängig vom Programmierstil.
Was wir in [1.3](#13-rückgabewert) mit einer Subroutine umgesetzt haben, ändere nun zu einer Fortran-Funktion (`function`).
Diese neue Funktion soll ein Argument erhalten und einen Rückgabewert haben (C-Code ebenfalls entsprechend anpassen).

### 1.4 String Argument

Nun zu einer etwas größeren Aufgabe.
Übergebe nun anstatt einer Zahl einen String an Fortran und gebe ihn mit Fortran auf der Konsole aus.
Schreibe dafür eine Subroutine und nutze zur Konvertierung des übergeben Strings die Funktion `cfconvert` aus dem Modul [strconv_lib](./strconv_lib.f90).

_Tipp: Die Größe des Strings in Fortran muss nicht sofort festgelegt werden, man benötigt aber die Länge des Strings schon als Wert von C. Einfacher ist es, wenn man zunächst die maximale Länge des Strings festlegt._

## 2 - Call C function from Fortran

Bisher haben wir Prozeduren in Fortran definiert und in C verwendet.
Nun soll es anders herum laufen: Wir rufen C-Funktionen in Fortran auf!

_Erinnerung: Um eine C-Funktion in Fortran verwenden zu können, muss sie im Fortran-Code in einem Interface definiert sein._

### 2.1 Void function without arguments

03:30 Minuten (33:00) → 3

Beginne wieder mit einem einfachen Programm, bei dem diesmal `main` in Fortran geschrieben und die verwendeten Prozeduren in C geschrieben sind.
Mache auch diesmal in beiden Programmteilen jeweils Ausgaben auf der Konsole.

_Tipp: Da die C-Funktion keinen Rückgabewert (`void`) hat, definiere zunächst im Interface dafür eine Subroutine._

### 2.2 Add function Argument (integer)

02:00 Minuten (35:00) → 2

Verändere nun den Code so, dass die C-Funktion eine Zahl als Argument nimmt und auf der Konsole ausgibt.

_Tipp: In C gibt es "pass-by-value" und "pass-by-reference". Nutze in diesem Fall "pass-by-value"._

### 2.3 Add return value

03:00 Minuten (38:00) → 3

Erweitere nun den Programmcode so, dass die C-Funktion einen Rückgabewert vom Typ `int` hat.
Gib diesen Rückgabewert in Fortran auf der Konsole aus.

### 2.4 String Argument

08:00 Minuten (46:00) → 5

Bisher wurden nur Zahlen über- und zurückgegeben.
Wie vorher in [1](#1---call-fortran-procedures-from-c) soll nun ein String das Argument für die Funktion sein.

Schreibe hierfür die C-Funktion so um, dass sie einen String als Argument und keinen Rückgabewert mehr hat.
In Fortran definiere nun wieder eine Subroutine im Interface, welche als Argument ein beliebig großes `character` array als argument erhält.

_Tipp: In C ist `char *s` äquivalent zu `char s[]`._
_Achtung: In C sind Strings immer durch NULL terminiert. Beim Aufruf der C-Funktion in Fortran sollte daher ein `c_null_char` am Ende des Strings sein._

## 3 Other Types

Nun betrachten wir die Kompatibilität ein paar anderer Datentypen.

### 3.1 C Struct

Bisher haben wir nur Intrinsische Datentypen und Strings (als Array) übergeben.
Sowohl C als auch Fortran kennen aber auch andere Datentypen: Das `struct` in C bzw. den abgeleiteten `type` in Fortran

Schreibe nun ein Programm in C, dass eine Subroutine von Fortran aufruft und dabei ein Struct übergibt.
Das Struct soll in Fortran mit werten befüllt werden.
Diese Änderungen sollen für C sichtbar sein.

_Tipp: Das Object muss hierbei in beiden Sprachen definiert sein. Übergebe das Struct in C als Referenz, z.B. so: `&s`._

### 3.2.1 Pointers - Code Example

was ist ein pointer in Fortran?

### 3.2.2 Function Pointers - Code Example

...
