program fibonacci
   implicit none
   integer :: num

   print "(a)", "Fibonacci von 0 bis 10:"
   do num = 0, 10
      write (*, "(i0, 1x)", advance="no") fibonacci_iterative(num)
   end do
   write (*,*)

contains

   function fibonacci_iterative(n) result(res)
      integer, intent(in) :: n
      integer, parameter :: fib0 = 0, fib1 = 1
      integer :: res, back1, back2, i

      select case (n)
       case (:0)
         res = fib0
       case (1)
         res = fib1

       case default
         res = fib1
         back1 = fib0
         do i = 2, n
            back2 = back1
            back1 = res
            res = back1 + back2
         end do
      end select
   end function fibonacci_iterative

end program fibonacci
