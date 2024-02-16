subroutine fortf (a) bind(C, name="fortf")
    use iso_c_binding
    implicit none

    integer(kind=c_int), intent(inout) :: a
    
    print "(a)", "Fortran says Hi!"
    print '("Fortran recived ", i0)', a
    
    a = a*a

    print '("Fortran returns ", i0)', a

end subroutine