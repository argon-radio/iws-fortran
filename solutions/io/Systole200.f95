program ReadCSV
    implicit none
    
    ! Definiere eine Datenstruktur für die Datensätze
    type :: MedDaten
        integer :: Timestamp
        integer :: Systole
        integer :: Diastole
        integer :: SpoZ
        integer :: Glucose
        integer :: Puls
    end type MedDaten
    
    ! Deklariere ein Array, um die Datensätze zu speichern
    type(MedDaten), dimension(:), allocatable :: Daten
    
    integer :: i, num_rows, iunit
    
    ! Öffne die CSV-Datei
    open(unit=10, file='MedDaten.csv', status='old')
    
    ! Zähle die Anzahl der Zeilen in der Datei
    num_rows = 0
    do
        read(10, *, iostat=iunit)
        if (iunit /= 0) exit
        num_rows = num_rows + 1
    end do
    
    ! Gehe zurück zum Anfang der Datei
    rewind(10)
    
    ! Allokiere Speicher für die Datenstruktur
    allocate(Daten(num_rows))
    
    ! Lese die Daten aus der CSV-Datei und speichere sie in der Datenstruktur
    do i = 1, num_rows
        read(10, *) Daten(i)%Timestamp, Daten(i)%Systole, Daten(i)%Diastole, &
            Daten(i)%SpoZ, Daten(i)%Glucose, Daten(i)%Puls
    end do
    
    ! Schließe die CSV-Datei
    close(unit=10)
    
    ! Durchgehe und gib die Daten aus
    do i = 1, num_rows
        if (Daten(i)%Systole > 200) then
           print *, "Datensatz ", i
           print *, "Timestamp:", Daten(i)%Timestamp
           print *, "Systole:", Daten(i)%Systole
           print *, "Diastole:", Daten(i)%Diastole
           print *, "SpoZ:", Daten(i)%SpoZ
           print *, "Glucose:", Daten(i)%Glucose
           print *, "Puls:", Daten(i)%Puls
           print *
        endif
    end do
    
    ! Freigebe den Speicher
    deallocate(Daten)

end program ReadCSV
