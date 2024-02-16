module strconv_lib
   use iso_c_binding
   implicit none

contains

   function cfconvert(strlen, strin) result(strout) ! cannot be called from c
      implicit none

      integer(kind=c_int), value, intent(in) :: strlen
      character(kind=c_char), intent(in) :: strin(*)
      character(:), allocatable :: strout
      character(len=strlen) :: strconv
      integer :: i

      strconv = ""

      loop_string: do i = 1, strlen
         if (strin(i) == c_null_char) then
            exit loop_string
         else
            strconv(i:i) = strin(i)
         end if
      end do loop_string

      strout = trim(strconv)

   end function cfconvert

end module strconv_lib
