program main
    use iso_c_binding
    implicit none
    
    interface
        subroutine cfunc(i) bind(c, name="cfunc")
            use iso_c_binding
            implicit none
            integer(kind=c_int), value, intent(in) :: i
        end subroutine cfunc
    end interface

    print "(a)", "Fortran says Hi!"

    call cfunc(2)

end program main