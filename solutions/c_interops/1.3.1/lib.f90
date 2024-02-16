module lib
    implicit none

contains
    
    function fortf (a) bind(C, name="fortf") result(res)
        use iso_c_binding
        implicit none

        integer(kind=c_int), value, intent(in) :: a
        integer(kind=c_int) :: res

        print "(a)", "Fortran says Hi!"
        print '("Fortran recived ", i2)', a
    
        res = 45

        print '("Fortran returns ", i2)', res

        return

    end function fortf

end module lib