program fortranStringArray
    implicit none
    
    integer :: n
    integer, dimension(3) :: int_arr
    character(len=10), dimension(3) :: string_arr

    int_arr = (/1, 2, 3/)
    int_arr = [1, 2, 3]

    !string_arr = (/"hello", "hallo", "hola"/)  !-- this will not work because the strings are of different lengths
    !string_arr = ["hello", "hallo", "hola"]    !-- this won't work for the same reason, here's how to do it:
    string_arr = [character(len=10) :: "hallo", "hello", "hola"]

    do n = 1, len(string_arr)
        print *, string_arr(n)
    end do

    !hier passt was ni ht

end program fortranStringArray