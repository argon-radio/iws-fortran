# Cheat Sheet: Verständnis des ReadCSV Programms

## Überblick

- **Funktion:** Das Programm liest medizinische Daten aus einer CSV-Datei und gibt sie aus.
- **Datenstruktur:** `MedDaten` speichert medizinische Aufzeichnungen.
- **Lesen der CSV-Datei:** Zählt Zeilen, allokiert Speicher und liest Daten.
- **Ausgabe:** Gibt medizinische Datensätze aus.
- **Speicherfreigabe:** Wichtig, um Speicher zu verwalten und Lecks zu vermeiden.

## Tipps zum Verständnis

- **`MedDaten` Typ:** Definiert Struktur der Daten.

  ```fortran
  type :: MedDaten
      integer :: Timestamp
      integer :: Systole
      integer :: Diastole
      integer :: SpoZ
      integer :: Glucose
      integer :: Puls
  end type MedDaten
  ```

- **CSV-Daten lesen:** Verwende `open`, `read` und `close`, um Daten aus der CSV-Datei zu lesen.

  ```fortran
  ! Öffnen der CSV-Datei
  open(unit=10, file='MedDaten.csv', status='old')
  
  ! Lesen der Daten
  read(10, *) Daten(i)%Timestamp, Daten(i)%Systole, Daten(i)%Diastole, &
      Daten(i)%SpoZ, Daten(i)%Glucose, Daten(i)%Puls
  
  ! Schließen der CSV-Datei
  close(unit=10)
  ```

- **Dateiverarbeitung:** Öffnen, Lesen und Schließen von Dateien.

  ```fortran
  ! Öffnen der Datei
  open(unit=10, file='MedDaten.csv', status='old')
  
  ! Schließen der Datei
  close(unit=10)
  ```

- **Speicherverwaltung:** Verwende `allocate` und `deallocate`, um Speicher zu verwalten.

  ```fortran
  ! Speicher allozieren
  allocate(Daten(num_rows))
  
  ! Speicher freigeben
  deallocate(Daten)
  ```
