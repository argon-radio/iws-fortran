program main
    use iso_c_binding
    implicit none
    
    interface
        subroutine cfunc(str) bind(c, name="cfunc")
            use iso_c_binding
            implicit none
            character(kind=c_char), dimension(*), intent(in) :: str
        end subroutine cfunc
    end interface

    print "(a)", "Fortran says Hi!"

    call cfunc(c_char_"I come from Fortran and this is crazy!"//c_null_char)

end program main