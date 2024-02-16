program fortranArrays
    implicit none

    !-- by default, Fortran array indices start at 1!

    integer, dimension(1:5) :: int_arr                  !-- integer array of size 5 with indices from 1 - 5
    real, dimension(5) :: real_arr                      !-- real array of size 5 with indices from 1 - 5
    integer, dimension(3,3) :: int_mat                  !-- two-dimensional integer array (matrix) with indices from 1 - 3 in both axis. Follows standard math. syntax
    integer, dimension(3,3) :: int_mat2
    integer, dimension(3,3) :: int_mat3
    real, dimension(1:3, 1:3) :: real_mat               !-- tow-dimensional real array (matrix) with indices from 1 - 3 in both axis. Follows standard math. syntax
    integer, dimension(-5:3, 3, 13) :: weird_mat        !-- integer matrix with custom dimensions
    integer, dimension(2,3) :: another_mat   !-- for arrays that are initialised during runtime. The amount of ':' separated by commas denotes the amount of dimensions (':' = range, hence ':,:' = two ranges)
    
    
    integer :: n, m !-- we'll use n and m to denote rows and columns in this example
    integer :: i, j   !-- we'll use i for implied loops and spare variables in this example 

    
    !-- initialise array
    
    int_arr = (/1,2,3,4,5/) !-- shorthand array construction: 

    real_arr = [5.5, 4.4, 3.3, 2.2, 1.1] !-- array constructor

    int_arr = [(i, i = 1, 5)] !-- array construction via implicit loop
    !read *, int_arr, (i, i = 1, 5)  !-- this does the same


    !-- address array 

    real_mat(1,1) = 1.1
    real_mat(1,2) = 2.2
    real_mat(1,3) = 3.3
    real_mat(2,1) = 4.4
    real_mat(2,2) = 5.5
    real_mat(2,3) = 6.6
    real_mat(3,1) = 7.7
    real_mat(3,2) = 8.8
    real_mat(3,3) = 9.9 

    weird_mat(-5,3,1) = 42

    !-- index access 

    int_arr(:) = 0 !-- set all elements to 0

    int_arr(1:3) = 14 !-- set all array indices from 1 to 3 to value 14

    int_arr(4:) = 15 !-- set all array indices starting at index 4 to value 15

    print "(a13 i2)", "int_arr(1) = ", int_arr(1) !--read int_arr on index 1

    print "(a20,3i3)", "int_arr(1:3) = ", int_arr(1:3) !-- print array int_arr indices 1 to 3
    print "(a20,2i3)", "int_arr(1:3:2) = ", int_arr(1:3:2) !-- print array int_arr indices from 1 to 3 in steps of 2
    print "(a20,3f5.2)", "real_mat(:,1) = ", real_mat(:,1) !-- print first column of matrix
    print "(a20,3f5.2)", "real_mat(1, :) = ", real_mat(1, :) !-- print first row of matrix
    print "(a20,5i3)", "int_arr(5:1:-1) = ", int_arr(5:1:-1) !--print array in reverse
    ! print *, "int_arr(1:3) = ", int_arr(1:3) !-- print array int_arr indices 1 to 3
    ! print *, "int_arr(1:3:2) = ", int_arr(1:3:2) !-- print array int_arr indices from 1 to 3 in steps of 2
    ! print *, "real_mat(:,1) = ", real_mat(:,1) !-- print first column of matrix
    ! print *, "real_mat(1, :) = ", real_mat(1, :) !-- print first row of matrix
    ! print *, "int_arr(5:1:-1) = ", int_arr(5:1:-1) !--print array in reverse



    print *, "" !-- empty line so it's easier to distinguish the two matrices


    !-- simply print matrix line by line

    do n = 1, size(real_mat, dim=1)
        print "(3f5.2)", real_mat(n, :)
    end do


    print *, "" !-- empty line so it's easier to distinguish the two matrices


    !-- simply print matrix column by column. Careful: this may look counterintuitive on the terminal! Printed rows are now actually the columns!

    do n = 1, size(real_mat, dim=2)
        print "(3f5.2)", real_mat(:, n)
    end do


    print *, "" !-- empty line so it's easier to distinguish the two matrices


    !-- easily print an array's sizes

    print "(a18,1i3)", "size(weird_mat) = ", size(weird_mat)   !-- size = number of elements the array contains
    print "(a18,2i2)", "rank(weird_mat) = ", rank(weird_mat) !-- rank = number of dimensions the array has
    print "(a18,3i3)", "shape(weird_mat) = ", shape(weird_mat)   !-- shape = array that denotes the number of elements in each dimension



    !-- next up - how to initialise such a matrix:
    !   |1 4 7|
    !   |2 5 8|
    !   |3 6 9|
    !-- Due to Fortran's column-major order, this matrix, if flattened, would look like this:
    !-- [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    !-- Option 1: classic via looping

    n = 1

    do i = 1, 3
        do j = 1, 3
            int_mat(i,j) = n 
            n = n + 1
        end do
    end do

    !-- less classic via two loops 
    
    do n = 1, 3
        do m = 1, 3
            int_mat(n,m) = n + (m - 1) * 3
        end do
        print *, ""
    end do

    do n = 1, size(int_mat, dim=1)
        print "(3i2)", int_mat(n, :)
    end do

    print *, "" !-- empty line so it's easier to distinguish the two matrices


    !-- Option 2: using fortran's merits

    int_mat = reshape((/1, 2, 3, 4, 5, 6, 7, 8, 9/), shape(int_mat))
    
    do n = 1, size(int_mat, dim=1)
        print "(3i2)", int_mat(n, :)
    end do



    !-- now, initialise this matrix:
    !   |1 2 3|
    !   |4 5 6|
    !   |7 8 9|
    !-- Due to Fortran's column-major order, this matrix, if flattened, would look like this:
    !-- [1, 4, 7, 2, 5, 8, 3, 6, 9]
    
    !-- Option 1: classic via looping

    do n = 1, size(int_mat, dim = 1) 
        do m = 1, size(int_mat, dim = 2)
            int_mat(n,m) = m + (n - 1) * 3
        end do
        print *, ""
    end do

    do n = 1, size(int_mat, dim = 1)
        print "(3i2)", int_mat(n, :)
    end do

    print *, "" !-- empty line so it's easier to distinguish the two matrices


    !-- Option 2: using fortran's merits in the form of transpose-intrinsic

    int_mat = transpose(reshape((/1, 2, 3, 4, 5, 6, 7, 8, 9/), shape(int_mat))) !-- reshape(m,x): rearranges matrix according to shape x
    
    do n = 1, size(int_mat, dim = 1)
        print "(3i2)", int_mat(n, :)
    end do

    
    !-- now, let's initialise this matrix:
    !   |1 2 3|
    !   |4 5 6|
    !-- This is tricky. Consider the following code:
    

    another_mat = reshape((/1, 2, 3, 4, 5, 6/), shape(another_mat))

    !-- Due to the column-major order, this will produce the following matrix:
    !-- |1 3 5|
    !-- |2 4 6|
    !-- transpose()-intrinsic won't work since alloc_mat is not a square matrix!
    !-- However, we can still quite easily initialise this matrix like so:

    another_mat = reshape((/1, 2, 3, 4, 5, 6/), shape(another_mat), order=(/2, 1/))

    !-- this works, because order=(/2,1/) means that the second dimension (columns) is filled 
    !-- before the first dimension (rows), effectively filling the array by rows instead of by columns


    !-- let's look into some intrinsics of Fortran to deal with Arrays

    !-- let's prepare two matrices, where the second one is the first one transposed

    int_mat = reshape((/1, 2, 3, 4, 5, 6, 7, 8, 9/), shape(int_mat))
    int_mat2 = transpose(int_mat)


    !-- we can also create matrices by adding, multiplying, etc

    int_mat3 = int_mat / int_mat2 !-- remember that decimal palces are truncated because we're using integers
    do n = 1, 3
        print "(3i3)", int_mat3(n, :)
    end do
    !-- when doing element-wise matrix operations, divisions by zero are possible and will result in "infinity"!


    print "(a35 l1)", "all(int_mat == int_mat2) = ", all(int_mat == int_mat2) !-- checks if all elements satisfy condition
    print "(a35 l1)", "any(int_mat == int_mat2) = ", any(int_mat == int_mat2) !-- checks if any two elements satisfy condition
    print "(1a30 i1)", "count(int_mat == int_mat2) = ", count(int_mat == int_mat2) !-- counts number of element pairs that satisfy condition
    print "(a35 i1)", "maxval(int_mat) = ", maxval(int_mat)
    print "(a35 i1)", "minval(int_mat) = ", minval(int_mat)
    print "(a35 i1)", "minval(int_mat) = ", maxloc(int_mat)
    print "(a35 i1)", "minval(int_mat) = ", minloc(int_mat)
    print "(a35 i4)", "product(int_mat) = ", product(int_arr)
    print "(a35 i2)", "sum(int_mat) = ", sum(int_mat)


    !-- we can also read matrices line by line from the terminal:

    do n = 1, 3
        read *, int_mat(n,:)
    end do

    !-- or by txt files: cat data.txt | ./simplex

end program fortranArrays