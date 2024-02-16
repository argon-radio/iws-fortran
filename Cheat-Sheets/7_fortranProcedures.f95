!-- there's two types of procedures in Fortran: Subroutines and Functions
!-- 1) subroutines have no return value and often manipulate their parameters (call-by reference-ish)
!-- 2) functions have a single return value and often have read only access to the parameters

module simple_determinants
    implicit none
    !-- we'll keep everything public for now
    contains    !-- types, functions and subroutines are to be preceded by "contains"

    !-- technically speaking, subroutines do not *have* to be included in modules and can be defined below main programmes
    !-- (or even inside a "program" if "contains" is provided)
    !-- however, it is considered good practice not to do so since it can drastically improve code readability, namespace management etc
    subroutine print_determinant(matrix)
        implicit none !-- yep, is required here again
    
        !-- we can optionally specify the intent of dummy variables:
        !-- intent(in) :: x => x is read-only
        !-- intent(out) :: x => x is for output only. The initial value of x is inaccessible and a value must be assigned before procedure ends
        !-- intent(inout) :: x => x can be read and overwritten
        !-- This is useful for functions where we can have several "return values" (call-by-reference-ish).
        !-- It is less useful for subroutines, since we define a specific return value

        integer, dimension(3,3), intent(in) :: matrix
        character(len=30) :: printable
        integer :: determinant = 0
    
        determinant = determinant + matrix(1,1) * matrix(2,2) * matrix(3,3) 
        determinant = determinant + matrix(1,2) * matrix(2,3) * matrix(3,1)
        determinant = determinant + matrix(1,3) * matrix(2,1) * matrix(3,2)
        determinant = determinant - matrix(1,3) * matrix(2,2) * matrix(3,1)
        determinant = determinant - matrix(1,2) * matrix(2,1) * matrix(3,3)
        determinant = determinant - matrix(1,1) * matrix(2,3) * matrix(3,2)
    
        write(printable, "(i10)") determinant    
        print *, "det(M) = ", printable
    end subroutine print_determinant
    
    function get_determinant(matrix) result(determinant)
        implicit none
    
        integer, dimension(3,3), intent(in) :: matrix
        integer :: determinant
    
        determinant = matrix(1,1) * matrix(2,2) * matrix(3,3) 
        determinant = determinant + matrix(1,2) * matrix(2,3) * matrix(3,1)
        determinant = determinant + matrix(1,3) * matrix(2,1) * matrix(3,2)
        determinant = determinant - matrix(1,3) * matrix(2,2) * matrix(3,1)
        determinant = determinant - matrix(1,2) * matrix(2,1) * matrix(3,3)
        determinant = determinant - matrix(1,1) * matrix(2,3) * matrix(3,2)
    
    end function get_determinant

    !-- let's look into optional dummy variables (= function parameters in Fortran)

    function get_sum_determinant(matrix, matrix2) result (determinantSum)
        implicit none 

        integer, dimension(3,3), intent(in) :: matrix 
        integer, dimension(3,3), intent(in), optional :: matrix2    !-- notice the keyword "optional" 

        integer :: determinantSum

        !-- initialisers for result values is not permitted, so we have to initialise it here

        determinantSum = 0 

        determinantSum = determinantSum + matrix(1,1) * matrix(2,2) * matrix(3,3) 
        determinantSum = determinantSum + matrix(1,2) * matrix(2,3) * matrix(3,1)
        determinantSum = determinantSum + matrix(1,3) * matrix(2,1) * matrix(3,2)
        determinantSum = determinantSum - matrix(1,3) * matrix(2,2) * matrix(3,1)
        determinantSum = determinantSum - matrix(1,2) * matrix(2,1) * matrix(3,3)
        determinantSum = determinantSum - matrix(1,1) * matrix(2,3) * matrix(3,2)

        !-- check if optional dummy variables exist

        if(present(matrix2)) then 
            determinantSum = determinantSum + matrix2(1,1) * matrix2(2,2) * matrix2(3,3) 
            determinantSum = determinantSum + matrix2(1,2) * matrix2(2,3) * matrix2(3,1)
            determinantSum = determinantSum + matrix2(1,3) * matrix2(2,1) * matrix2(3,2)
            determinantSum = determinantSum - matrix2(1,3) * matrix2(2,2) * matrix2(3,1)
            determinantSum = determinantSum - matrix2(1,2) * matrix2(2,1) * matrix2(3,3)
            determinantSum = determinantSum - matrix2(1,1) * matrix2(2,3) * matrix2(3,2)
        end if 

    end function get_sum_determinant

    !-- let's see how that call-by-reference-ish behaviour works and change a matrix without return value:

    subroutine replace_all_numbers_with(matrix, n)
        implicit none
        
        integer, dimension(:, :), intent(out) :: matrix !-- the matrix to be edited
        integer, intent(in) :: n    !-- the number with which all matrix entries shall be replaced
        integer :: i    !-- used for iterating matrix
        integer, dimension(2) :: matrix_shape   
        integer :: nbOfRows

        matrix_shape = shape(matrix)
        nbOfRows = matrix_shape(1)

        matrix = reshape([(n, i=1,nbOfRows**2)], matrix_shape)
    end subroutine replace_all_numbers_with

    !-- interestingly, recursive functions need to be denoted as such:

    recursive function factorial(n) result(f)
        integer :: n, f 
         if(n == 1) then 
            f = 1 
        else 
            f = n * factorial(n - 1) 
        end if 
    end function factorial

    !-- another neat, yet old, feature in fortran, thats use is discouraged as of Fortran 90:
    !-- functions and subroutines can have several entry points. Check the lower part of the main program to see how they work!

    subroutine multiple_entries() 
        implicit none 
        integer, intent(in) :: n

        print *, "top"

        entry foo
        
        print *, "foo"

        entry bar(n)

        print *, "bar, n = ", n

    end subroutine multiple_entries

    !-- another outdated feature of Fortran: saving non-dummy-variables, so their value will be saved between 
    !-- subroutine/function executions! That means, these variables will not be removed from function stack!
    subroutine save_value() 
        implicit none
        integer :: proc_call_count = 0  !-- when declared like this in a procedure, the variable will implicitly be saved
        save proc_call_count     !-- but that is how we would save it manually

        proc_call_count = proc_call_count + 1
        print *, "called this subroutine ", proc_call_count, " times"
    end subroutine save_value

    !-- interfaces??
end module simple_determinants

program procedures
    use simple_determinants
    implicit none

    integer :: i 
    integer, parameter :: n = 3
    integer, dimension(n,n) :: matrix 

    matrix = reshape((/1, 2, 3, 4, 5, 6, 7, 8, 9/), shape(matrix))

    !-- first, let's use the subroutine to print the matrix' determinant:

    call print_determinant(matrix)    !-- call subroutines with "call"

    !-- now, let's use a function for the same calculation and print the result ourselves:

    print *, "det(M) = ", get_determinant(matrix) !--for functions, we don't need "call"

    !-- test optional dummy variables:

    print *, "det(M) + [nothing here] = ", get_sum_determinant(matrix)

    !-- let's see how that call-by-reference-ish behaviour works and change a matrix without return value:

    print *, "Matrix before subroutine call: "
    print *
    do i = 1, n 
        print *, matrix(i, :)
    end do

    call replace_all_numbers_with(matrix, 1)

    print *, "Matrix after subroutine call: "
    print *
    do i = 1, n 
        print *, matrix(i, :)
    end do

    !-- finally, let's try a recursive function:

    print *, "5! = ", factorial(5)


    !-- let's try entries into functions/subroutines:

    i = 5
    call multiple_entries()
    call foo()
    call bar(i)


    !-- let's test saving values in subroutines/functions:

    call save_value()
    call save_value()
    call save_value()
    call save_value()

end program procedures

