module lib
    use iso_c_binding
    implicit none
    
    type, public, bind(c) :: compatible
        integer(c_int) :: i1
        real(c_double) :: d1
    end type compatible

contains

    subroutine fillstruct(s) bind(c, name="fillstruct")
        type(compatible), intent(inout) :: s
        
        s%i1 = 55
        s%d1 = 2.345
        
    end subroutine fillstruct

end module lib