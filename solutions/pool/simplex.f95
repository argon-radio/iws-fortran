!simplex_2
module simplex_solver
    implicit none 

    contains

    subroutine solve(n_rows, n_cols, tableau)
        implicit none

        integer, intent(in) :: n_rows, n_cols
        double precision, dimension(n_rows,n_cols), intent(inout) :: tableau

        !-- here, we'll store the values of the rightmost column divided by the pivot column values
        double precision, dimension(n_rows - 1) :: tmp

        integer :: p_col !-- pivot column
        double precision :: p_col_val   !-- value of pivot column in obj.func.
        integer :: p_row !-- pivot row
        double precision :: p_row_val  

        integer :: i    !-- for iterating
        integer :: iter !-- for counting iterations

        iter = 0

        !-- first, we need to find the largest obj.func. value
        p_col = maxloc(tableau(n_rows,:), dim=1)
        p_col_val = maxval(tableau(n_rows,:), dim=1)

        !-- iterate until there's no positive value in obj.func. row left
        do while (p_col_val > 0)
            iter = iter + 1
            print "('iteration ' i0)", iter

            !-- divide rightmost column by values in each row at column p_col
            !-- not the obj.func.row though!
            !-- luckily we can simply divide element-wise in fortran, so loops necessary!
            tmp = tableau(1:n_rows - 1, n_cols) / tableau(1:n_rows-1, p_col)
            !-- correct any potential divisions by zero
            !do i = 1, n_rows - 1
            !    if (tmp(i) > huge(tmp(i))) tmp(i) = 0
            !end do
            print *, "tmp = " , tmp

            p_row = minloc(tmp, dim=1)
            
            !-- now tableau(p_row,p_col) is the pivot element

            print "('p_row = ' i0)", p_row
            print "('p_col = ' i0)", p_col
            print *, "pivot element = ", tableau(p_row,p_col)

            !-- now, we scale the pivot row
            tableau(p_row,:) = tableau(p_row,:) / tableau(p_row,p_col)
            print *, "tableau(p_row,:) = ", tableau(p_row,:)
            
            do i = 1, n_rows
                if (i == p_row) cycle !-- we don't transform the pivot row
                if (tableau(i,p_col) == 0) cycle  !-- we don't transform rows where the pivot column value is equal to zero
                
                p_row_val = tableau(i,p_col)
                tableau(i,:) = tableau(i,:) - p_row_val * tableau(p_row,:)
            end do  

            !-- now, we need to find the largest obj.func. value again (until there's only <=0 left)
            p_col = maxloc(tableau(n_rows,:), dim=1)
            p_col_val = maxval(tableau(n_rows,:), dim=1)
            print *, "p_col_val = ", p_col_val 
        end do
    end subroutine

    subroutine evaluate_result_tableau(n_rows, n_cols, tableau, results)

        integer, intent(in) :: n_rows, n_cols
        double precision, dimension(n_rows,n_cols), intent(in) :: tableau
        integer :: r_row    !-- result row = the row that features the 1 in the column

        double precision, dimension(n_cols), intent(out) :: results
        integer :: i  !-- again, only for iterating

        do i = 1, n_cols-1 !-- we want to skip the rightmost column for now
            if(check_column(n_rows, tableau(:,i))) then
                print *, "Row okay: ", i
                !-- find the 1 (which will be maxval of that column)
                !-- look in the rightmost col in the exact row where we found the 1
                !-- save that value as the result for this variable
                r_row = maxloc(tableau(:,i), dim=1) !--r_row must be where the 1 is at this point
                results(i) = tableau(r_row,n_cols)
            else
                !-- if there's not only zeroes and a single "1", the result for this variable will be 0
                results(i) = 0.0
            end if
        end do

        !-- now we only need to note the result value for the obj.func.
        results(n_cols) = abs(tableau(n_rows,n_cols))
    end subroutine evaluate_result_tableau

    function check_column(n_rows, col) result(only_one_one)
        implicit none 

        integer, intent(in) :: n_rows
        double precision, dimension(n_rows), intent(in) :: col

        logical :: only_one_one
        integer :: n_ones, n_zeroes  !-- we'll count ones and zeroes with these

        n_ones = count(col == 1.0)
        n_zeroes = count(col == 0.0)

        if(n_ones == 1 .and. n_zeroes == n_rows-1) then 
            only_one_one = .true.
        else 
            only_one_one = .false.
        end if
    end function check_column

end module simplex_solver

program linear_programming
    use simplex_solver
    implicit none

    !-- firstly, we want to define the tableau with its row and columns numbers:
    integer, parameter :: n_rows = 4, n_vars = 3, n_cols = 2 * n_vars + 1   !-- we only work with <=-relations, hence, the amount of columns will always be n_var * 2 + 1
    double precision, dimension(n_rows,n_cols) :: tableau
    double precision, dimension(n_cols) :: results
    integer :: i    !-- used for iterating

    print '(A)', "Number of:"
    print '("  rows      = ", i0)', n_rows
    print '("  colmuns   = ", i0)', n_cols
    print '("  variables = ", i0)', n_vars

    do i = 1, n_rows 
        read *, tableau(i,:)
    end do

    print "(A)", "Coefficient matrix:"
    do i = 1, n_rows
      print *, tableau(i, :)
    end do

    print *, "Now solving..."
    call solve(n_rows, n_cols, tableau)

    call evaluate_result_tableau(n_rows, n_cols, tableau, results)

    do i = 1, n_cols
        print *, "result(", i, ") = ", results(i)
    end do

    print "(A)", "Optimal tableau:"
    do i = 1, n_rows
      print *, tableau(i, :)
    end do

end program linear_programming