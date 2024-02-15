# **Cheat Sheet Coarrays**

In Fortran repräsentieren Coarrays verteilte Datenstrukturen, die auf mehreren "Images" (eine Art von Prozessen oder Threads) existieren. Jedes Image hat seinen eigenen Satz von Coarrays und kann auf die Coarrays der anderen Images zugreifen. Dies ermöglicht eine direkte Kommunikation zwischen den Images und die gleichzeitige Ausführung von Code.

# Coarrays

## Algemeine Befehle

### Compiler
Compilieren von Dateien
- `caf <file> -o <output-file>`  

Ausführen von Dateien, `np` gibt die Anzahl der Images an
- `cafrun -np <num_images> <output-file>`

Alles auf einmal
- `caf <file> -o <output-file> && cafrun -np <num_images> <output-file>`
    
### Informationen über Images
Ausgabe des momentanen Images
- `this_image()`

Anzahl der Images
- `num_images()`

### Synchronisation von Images
Synchronisieren von Images
- `sync all`

Beispielcode, bei dem Image 2 zu lange braucht um eine Variable zu initialisieren und deswegen ein `sync all` nötig ist
```f90
integer :: a[*]
if (this_image() == 2) then
    call sleep(2)
    a = 2
end if
! sync all hier, damit die Ausgabe korrekt ist
sync all
print *, "Image", this_image(), "a[2]", a[2]
```

### Häufiger Code
Typischerweise werden Ausgaben oder Eingaben nur auf einem Image gehandhabt.
Ausgabe
```f90
if (this_image()==1) then
    print *, "..."
end if
```

Häufig wird auf einem Image durch alle anderen Images iteriert, um an die Werte der Coarrays in allen Images zu gelangen.
```f90
if (this_image()==1) then
    do i=1, num_images()
        print *, "Image", i, "coarray", a[i]
end if
```

## Deklaration von Coarrays
Deklaration von Coarrays
- Skalar: `integer :: a[*]`
- Vektor: `integer, dimension(:) :: a[*]`

## Zugriff auf Coarrays
Lesen von Coarrays, `i` ist der Index des gewünschten Images
- Skalar: `var = a[i]`
- Vektor: `var = a(:)[i]`

Schreiben von Coarrays
- Skalar: `a[i] = var`
- Vektor: `a(:)[i] = var`

Die Angabe vom Index in eckigen Klammern ist **nicht** nötig, wenn man auf das Coarray im eigenen Image zugreifen möchte.

## Collective Subroutines
Diese Funktionen arbeiten ohne explizit definierte Coarrays, es genügen ganz normale Variablen.

### co_sum
Summiert die Werte aller Images auf und speichert sie in der mitgegeben Variable auf allen Images ab
- `call co_sum(var)`

### co_min
Findet das Minimum aller Images und speichert sie in der mitgegeben Variable auf allen Images ab
- `call co_min(var)`

### co_max
Findet das Maximum aller Images und speichert sie in der mitgegeben Variable auf allen Images ab
- `call co_max(var)`

### co_broadcast
Verteilt eine Variable von dem ursprünglichen Images `i` auf alle anderen Images.
- `call co_broadcast(var, i)`

## Hilfreiche Funktionen

### sleep
Die Ausführung von Code für n Sekunden pausieren
```f90
integer :: n = 0
call sleep(n)
```

### random_number
Generieren von Zufallszahlen
```f90
real :: rand
call random_number(rand)
```


# Memory Allocation
Deklarieren von allokierbaren Vektoren
- Vektor: `real, dimension(:), allocatable :: vector`

Allokieren dieser Variable mit der Dimension `dim`
- Vektor: `allocate(vector(dim))`

Deallokieren von Variablen
- `deallocate(vector)`