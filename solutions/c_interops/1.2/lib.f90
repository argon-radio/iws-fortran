subroutine fortf (a) bind(C, name="fortf")
    use iso_c_binding
    implicit none

    integer(kind=c_int), value, intent(in) :: a
    
    print "(a)", "Fortran says Hi!"
    print '("Fortran recived ", i2)', a

end subroutine