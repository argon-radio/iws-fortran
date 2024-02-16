program gcd
   implicit none

   integer :: n = 65, m = 55
   integer :: div
   call gcd_iterative(n, m, div)
   print "(a, i0, a, i0, a, i0)", "GCD of ", n, " and ", m, ": ", div

contains

   subroutine gcd_iterative(a, b, divisor)
      integer, intent(out) :: divisor
      integer, intent(in) :: a, b
      integer :: tt, ta, tb

      ta=a
      tb=b

      do while( tb /= 0 )
         tt = ta
         ta = tb
         tb = mod(tt, tb)
      enddo
      divisor = abs(ta)
   end subroutine gcd_iterative

end program gcd
