program fibonacci
   implicit none
   integer :: num

   print "(a)", "Fibonacci von 0 bis 10:"
   do num = 0, 10
      write (*, "(i0, 1x)", advance="no") fibonacci_recursive(num)
   end do
   write (*,*)

contains

   recursive function fibonacci_recursive(n) result(res)
      integer, intent(in) :: n
      integer :: res

      select case (n)
       case (:0)
         res = 0
       case (1)
         res = 1
       case default
         res = fibonacci_recursive(n-1) + fibonacci_recursive(n-2)
      end select
   end function fibonacci_recursive

end program fibonacci

