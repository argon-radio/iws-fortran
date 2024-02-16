program numberGuessingGame
    implicit none 

    real :: rand
    integer :: input, low, high, roundCount, max_rounds
    logical :: foundNumber = .false.

    print *, "How many guesses should the player have?"
    read *, max_rounds

    print *, "In what range should the random number be? Enter lower and upper bounds:"
    read *, low, high

    call random_number(rand)
    rand = low + floor((high + 1 - low) * rand)

    print "('Guess the random number. You have ' i0 ' tries!')", roundCount

    do roundCount = 1, max_rounds
        print *, "Your guess:"
        read *, input

        if (input < rand) then
            print *, "too low"
        else if (input > rand) then
            print *, "too high"
        else 
            print *, "You found it!"
            foundNumber = .true.
            exit
        end if
    end do

    if(.not. foundNumber) then
        print *, "Aww heck, you did not find it."
        print "('The number was ' i0)", int(rand)
    end if

end program numberGuessingGame
