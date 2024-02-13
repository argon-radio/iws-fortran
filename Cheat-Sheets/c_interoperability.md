# C Interoperabilität mit Fortran

Eine Liste der Konstanten und intrinsischen Prozeduren des Moduls `ISO_C_BINDING` ist in der [GCC online documentation](https://gcc.gnu.org/onlinedocs/gfortran/ISO_005fC_005fBINDING.html) zu finden.

Überall, wo Interoperabilität gewährleistet werden soll, muss das Modul `ISO_C_BINDING` verwendet werden:

```f90
program main
   use iso_c_binding
   implicit none

   ! Code

end program main
```

## C-kompatible Typen

### Intrinsische Typen

```f90
integer(c_int) :: i
real(c_float) :: f
character(c_char) :: c
```

ist äquivalent zu

```c
int i;
float f;
char c;
```

### Derived Types

```f90
use iso_c_binding
type, bind(c) :: myType
    integer(kind=c_int) :: i
    real(kind=c_double) :: d
    character(kind=c_char) :: c(10)
end myType
```

ist äquivalent zu

```c
struct {
    int i;
    double d;
    char c[10];
} myType
```

## Globale Variablen

```f90
program main
    use iso_c_binding
    integer(kind=c_int), bind(c, name="global_var") :: global_var ! In C sichtbar
    integer :: global_var2 ! In C unsichtbar

    ! Code

end program main
```

## Prozeduren

### Fortran in C

Die C-kompatible Fortran-Funktion

```f90
function testf(a) result(b) bind(c, name="testf")
    use iso_c_binding
    integer(kind=c_int), value, intent(in) :: a
    integer(kind=c_int) :: b

    ! code hier

end function testf
```

kann in C einfach aufgerufen werden:

```c
int testf(int a); // Function Prototype verhindert Compiler-Warnungen

b = testf(a);
```

### C in Fortran

Für die C-Funktion

```c
int doublenumber(int n) {
    return n*2;
};
```

benötigt Fortran ein Interface zum Aufrufen:

```f90
interface
    integer(c_int) function double_number(n) bind(c, name="doublenumber")
        use iso_c_binding
        integer(c_int), value, intent(in) :: n
    end function
end interface

! ...

i = double_number(4)
```
