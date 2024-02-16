subroutine fortf () bind(C, name="fortf")
    use iso_c_binding
    implicit none
    
    print "(a)", "Fortran says Hi!"

end subroutine