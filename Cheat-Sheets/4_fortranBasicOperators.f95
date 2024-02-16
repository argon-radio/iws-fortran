program basicOperators
    implicit none
    
    !-- comparison operators:   ==      /=      >       <       >=      <= 
    !-- alternatives:           .eq.    .ne.    .gt.    .lt.    .ge.    .le.

    !-- logical operators: .and. .or. .not. .eqv.("equivalent") .neqv.("not-equivalent")

    integer :: age = 0
    integer :: i, j, n = 0 !-- we'll need that later

    if (age == 1 .or. age .eq. 2) then          !-- "==" = ".eq."
        print *, "Baby"
    else if (age >= 3 .and. age <= 6) then
        print *, "Kindergarten"
    else if (age .ge. 6 .and. age .le. 10) then !-- ".ge"/".le" = ">="/"<="
        print *, "Elementary school"
    else if (age >= 10 .and. age <= 18) then
        print *, "Secondary school"
    else 
        print *, "Out of school"
    end if

    !-- for short statements, we can abbreviate if-conditionals:

    if (age == 0) print *, "newborn"

    select case(age)
    case (1)
        print *, "Baby"
    case (2)
        print *, "Baby"
    case (3, 4, 5)
        print *, "Kindergarten"
    case (6:18)
        print *, "School"
    case default
        print *, "Grown up, do what you will"
    end select

    print *, "Logic: TRUE OR TRUE AND FALSE = ", .true. .or. .true. .and. .false. 
    print *, "Logic: (TRUE OR TRUE) AND FALSE = ", (.true. .or. .true.) .and. .false.
    print *, "Logic: TRUE OR (TRUE AND FALSE) = ", .true. .or. (.true. .and. .false.)
    print *, "Logic: TRUE <==> (NOT FALSE) = ", .true. .eqv. .not. .false.

    !-- let's test this

    !-- note that "unequal" is not "!=" but "/="

    print *, "5 /= 4 = ", 5 /= 4 

    !-- alphabetical sorting is easy!

    print *, """a"" < ""b"" = ", "a" < "b" !-- all these extra quotation marks are for better readability on the console

    !-- let's find all the even numbers between 0 and age in two different ways

    !-- 1) do-loop

    age = 15

    do n = 0, age, 2
        print "(1i2)", n 
    end do

    print "(a)", ""
    n = 0 !-- reset n

    !-- do-while-loop

    do while(n < age)
        if(mod(n,2) == 0) then
            print "(1i2)", n 
        end if
        n = n + 1   !-- sadly, there's no postincrement 
    end do

    !-- nothing too fancy

    !-- this, however, might be
    !-- name loops uniquely!

    outer_loop: do i = 1, 10
        inner_loop: do j = 1, 10
            print "(1i5)", i * j 
        end do inner_loop
    end do outer_loop


    !-- note: fortran equivalent of "continue" is "cycle" and "break" is "exit" 

end program basicOperators

!-- number_guessing game time!