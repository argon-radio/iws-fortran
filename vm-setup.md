# VM Setup

Die Aufgaben in diesem Workshop sind alle für eine bestimmte Umgebung getestet, die in der Workshop VM eingerichtet ist.
Diese Anleitung führt Schritt für Schritt auf, wie die VM installiert und eingerichtet wird.

## Verwendete Software

Die VM wird in [VMware Player](https://customerconnect.vmware.com/en/downloads/info/slug/desktop_end_user_computing/vmware_workstation_player/17_0) installiert, kann aber auch in anderen Virtualisierungsumgebungen wie VirtualBox betrieben werden.

Als Basis dient [Debian 12](https://www.debian.org/download) mit KDE Plasma als Desktop-Umgebung.
Als IDE wird [VS Code](https://code.visualstudio.com/download) verwendet mit der Modern Fortran Erweiterung.
Für das Kompilieren von Quellcode wird hauptsächlich der GNU-Fortran-Compiler verwendet.

Weitere wichtige Pakete sind:

- `fortran-language-server`
- `findent`
- `openmpi-bin`
- `libopenmpi-dev`
- `libcoarrays-dev`
- `libcoarrays-openmpi-dev`
- `libcaf-openmpi-3`

## Setup

Zunächst muss in VMware eine neue VM angelegt werden, in die das Debian-Installer-Image eingebunden ist.
Diese VM benötigt außerdem noch folgende, empfohlene Einstellungen (je nach Leistung und Speicherplatz des Host-Betriebssystems können mehr RAM, Prozessorkerne und Festplattenspeicher bereitgestellt werden):

Setting | Minimum | Recommended
:---: | :--- | :---
Memory | 6 GB (6144 MB) | 8 GB (8192 MB)
Processors | 2 | 4
Hard Disk Space | 14 GB | 20 GB (single file, no splitting)
Network Adapter | NAT | NAT

### OS

Sobald die VM gestartet ist, sollte sie den Installer laden.
Bitte den Anweisungen des Installers folgen.
Die nachfolgend gelisteten Einstellungen sollten auch so vorgenommen werden:

- Root Passwort: leer lassen (neuer User hat Admin-Rechte)
- Partition Disks: "Guided - use entire disk"
- Partitioning scheme: "all files in one partition"
- Software selection (nur die folgenden auswählen):
  - "Debian desktop environment"
  - "KDE Plasma"
  - "standard system utilities"

Nach Abschluss der Installation des Betriebssystems wird die VM neugestartet und sollte dann normal Debian 12 booten.

### Software

Nach der Anmeldung müssen nun noch die entsprechende Software installiert werden.
Dazu in einem Terminal (Konsole) zunächst das Betriebssystem auf den aktuellsten Stand bringen:

```sh
sudo apt update && sudo apt upgrade
```

Falls danach ein Neustart nötig ist, diesen vor dem nächsten Schritt durchführen.

Als nächstes werden die zusätzlichen Pakete installiert:

```sh
sudo apt install gfortran fortran-language-server findent openmpi-bin libopenmpi-dev libcoarrays-dev libcoarrays-openmpi-dev libcaf-openmpi-3
```

Anschließend muss noch VS Code installiert werden.
Dafür muss das Paket von der [VS Code Download-Seite](https://code.visualstudio.com/download) heruntergeladen werden und kann anschließend mit dem folgenden Befehl installiert werden ("xxxx" muss entsprechend der heruntergeladenen Datei angepasst werden):

```sh
dpkg -i code_xxxx.deb
```

Anschließend sollte sich VS Code über das grafische Startmenü der Desktop-Umgebung lassen.
In VS Code muss nun noch die Erweiterung Modern Fortran im Reiter "Extensions" hinzugefügt werden (Suche nach "Modern Fortran" von "fortran-lan.org").

### Test

Nach Abschluss aller Installationsschritte erkennt VS Code eine Fortran Quellcodedatei mit der Endung `.f90` und nimmt entsprechendes Syntax-Highlighting vor.

#### GFortran

Erstelle in VS Code eine Datei `hello.f90` mit dem folgenden Inhalt (einfaches Hello World Programm):

```f90
program hello
   implicit none
   print *, "Hello, World!"
end program hello
```

Führe anschließend diesen Befehl im Terminal im selben Ordner aus:

```sh
gfortran hello.f90 -o hello && ./hello
```

Als Ergebnis erscheint die Ausgabe `Hello, World!` (Die seltsame Einrückung der Ausgabe ist normal.)

#### Caf & Cafrun

Erstelle eine zweite Datei namens `coarray_test` mit dem folgenden Inhalt:

```f90
program coarray_test
   implicit none
   print *, "Image ", this_image()
end program coarray_test
```

Kompilieren und Ausführen der Datei:

```sh
caf coarray_test.f90 -o coarray_test && cafrun -np 2 coarray_test
```

Als Ergebnis werden zwei Zeilen im Terminal ausgegeben mit `Image 1` und `Image 2`
