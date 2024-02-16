program basicTypes

    !-- all variable declarations have to appear on top! 
    !-- Variable names are case-insensitive!
    !-- uninitialised variables have undefined behaviour!

    implicit none !-- disables implicit types --!

    real, parameter :: PI = 3.1415 !-- parameter >> const
    real :: r_num = 5.0
    double precision :: dbl_num = 1.11111111111111111d+0
    double precision :: dbl_num2 = 1.11111111111111111 !unterschied klären!
    integer :: i_num = 0
    logical :: can_vote = .true.
    character (len=10) :: month = "January"
    complex :: com_num = (2.0, 4.0)
    
    print *, dbl_num
    print *, dbl_num2
    print "(a15, 1f50.10)", "Biggest real: ", huge(r_num)
    print "(a15 i50.10)", "Biggest int: ", huge(i_num)
    print *, "Smallest real: ", tiny(r_num)
    print *, "r_num = ", r_num
    print *, "i_num = ", i_num
    print *, "com_num = ", com_num
    print *, "can_vote", can_vote
    print *, "character = ", month

    !-- let's test this

    !-- replacing "print *" with print "ax, iy": ax = x space for text, iy = y space for integer --!
    
    print "(a4, i10)", "Int ", kind(i_num) !-- kind(...) returns number of bytes
    print "(a5, i10)", "Real ", kind(r_num)
    print "(a7, i10)", "Double ", kind(dbl_num)
    print "(a8, i10)", "Logical ", kind(can_vote)

    !-- let's test it
    
end program basicTypes