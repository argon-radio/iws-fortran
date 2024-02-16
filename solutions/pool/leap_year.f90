program leapyear
   implicit none
   integer :: i

   print "(a)", "Schaltjahre:"

   do i = 1900, 2000
      if (isleap(i)) then
         write (*, "(i0, 1x)", advance="no") i
      end if
   end do
   write (*,*)

contains

   function isleap(year) result(res)
      integer, intent(in) :: year
      logical :: res

      res = mod(year, 4) == 0 .and. .not. mod(year, 100) == 0 .or. mod(year, 400) == 0

   end function isleap

end program leapyear
