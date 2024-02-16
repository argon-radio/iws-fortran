program main
    use iso_c_binding
    implicit none
    
    interface
        subroutine cfunc() bind(c, name="cfunc")

        end subroutine cfunc
    end interface

    print "(a)", "Fortran says Hi!"

    call cfunc()

end program main