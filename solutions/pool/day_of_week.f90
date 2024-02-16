program day_of_week
   implicit none
   integer :: day, month, year

   day = 13
   month = 09
   year = 2024

   print "(a, i0, a, i0, a, i0)", "Date: ", day, ".", month, ".", year
   print "(a, i0)", "Weekday: ", dow(day, month, year)

contains

   function dow(d, m, y) result(weekday)
      integer, intent(in) :: d, m, y
      integer :: weekday, tm, ty, j, k

      tm = m
      ty = y

      if (tm < 2) then
         tm = tm + 12
         ty = ty -1
      end if
      j = ty / 100
      k = mod(ty, 100)
      weekday = mod((d + ((tm+1)*26)/10 + k + k/4 + j/4 + 5*j), 7)

   end function dow

end program day_of_week
