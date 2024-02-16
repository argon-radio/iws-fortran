program gcd
   implicit none

   integer :: n = 45, m = 55
   print "(a, i0, a, i0, a, i0)", "GCD of ", n, " and ", m, ": ", gcd_recursive(n, m)

contains

   recursive function gcd_recursive(a, b) result(gcd)
      integer, intent(in) :: a, b
      integer :: gcd

      if (mod(a, b) /= 0) then
         gcd = gcd_recursive(b, mod(a, b))
      else
         gcd = b
      end if
   end function gcd_recursive

end program gcd

