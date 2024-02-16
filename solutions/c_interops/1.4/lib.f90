module lib
   use iso_c_binding
   use strconv_lib
   implicit none

contains

   subroutine fprint (len, str) bind(C, name="fprint")
      implicit none

      integer(kind=c_int), value, intent(in) :: len
      character(kind=c_char), intent(in) :: str(*)

      print "(a)", "Fortran says Hi!"

      print '(a, a, a)', 'Fortran on behalf of C: "', cfconvert(len, str), '"'

   end subroutine

end module lib
