program main
    implicit none
    
    interface
        integer(c_int) function cfunc(i) bind(c, name="cfunc")
            use iso_c_binding
            implicit none
            integer(kind=c_int), value, intent(in) :: i
        end function cfunc
    end interface

    print "(a)", "Fortran says Hi!"

    print '("Fortran received ", i2)', cfunc(2)

end program main