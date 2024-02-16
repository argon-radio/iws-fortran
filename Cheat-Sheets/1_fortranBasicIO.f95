!-- a programme begins with "program" and the programme's name
!-- and ends with "end programme" followed by the same 

!-- comments can be inserted by "!"
program basicIO

    !-- either the first or the second thing you do in a programme is this:
    !-- in Fortran, types can be implicit, which means that all variables that start
    !-- with either i,j,k,l,m or n will be integers etc.
    !-- we don't do that here
    
    implicit none 
    !-- all variables have to be declared on top of the programme

    !-- let's start with basic I/O operations
    !-- this is a string, yes, we have to give it a certain length from the get-go
    !-- we'll look at dynamically allocatable data types later
    character(len=5) :: some_string !-- will be used later
    
    !-- we can also denote like so, too:
    character*10 :: name

    !-- actually there's even more variants, as is there for many other things we'll look into today
    !-- but let us stick to as few rules as possible, so we don't confuse one another

    character (len=20) :: second_name
    character(len=31) :: greeting
    character(len=31) :: full_name

    !-- heck, let's be wild and already declare two integers (we'll need them later on):

    integer :: n, m

    !-- constants can be declared like this:

    real, parameter :: cm2inch = 2.54   !-- 1" = 2.54cm and vice versa

    !-- Let's start doing stuff by printing some strings!

    print *, "What's your first name?" !-- Fortran is right justified by default
    read *, name    !-- we can read from terminal with "read *,..."

    print *, "What's your surname?"
    read *, second_name  

    print *, "Name: ", name
    print *, "Second name: ", second_name

    !-- easy enough, init?
    !-- let's start this programme:
    !-- compile: gfortran fortranBasicIO.f95 !-- yep, I typically use f95 (for no particular reason though)
    !-- result of a compilation will be:
    !-- a.exe on windows, a.out on Linux
    !-- if you want your executable to have a specific name, you can specify that the usual way:
    !-- gfortran fortranBasicIO.f95 -o fortranBasicIO

    !-- you can also read and print several values in one go:
    read *, name, second_name
    print*, "Hello ", name, second_name

    !-- or you concatenate the strings first using "//":
    greeting = "Hello "//trim(name)//" "//trim(second_name) !-- use "trim(x)" to remove unnecessary spaces due to centre aligning
    print *, greeting

    !-- let's test that very quick

    !-- let's use a specific name so we all share the same results from now on:
    name = "Patrick"
    second_name = "Star"
    
    !-- let's update "greeting" so that it says "hello Patrick Star"
    greeting = "Hello "//trim(name)//" "//trim(second_name)

    !-- now suppose we want to find the substring "Patrick" without counting letters:
    n = index(greeting, "Patrick") !--index(...) finds the first index of the given substring 
    m = index(greeting, "Star")
    name = greeting(n:m-2) !-- minus 2 because we want to skip the first letter of "Star" and the blank space
    print *, name !-- print substrings using ranges

    !-- let's test that

    !-- now, suppose we want to omit only "hello":
    n = index(greeting, "Patrick") !-- no change here
    m = len(greeting)   !-- len(x) returns the length of string x (len(x) is the index of the last character, because fortran is 1-based!)
    full_name = greeting(n:m)   !-- Fortran has ranges 
    print *, full_name

    !-- let's test that

    !-- Output is normally centre aligned

    !-- Integer formatting follows this scheme: 
    !-- RiW: R = amount of Repetitions for this rule; i = for Integers; W = width for each value

    print *, 10 !-- default=centre aligned
    print "(3i5)", 7 ,6, 8, 9 !-- read: "print 3 integers with width 5"; the rest will be printed into new lines
    print "(i5)", 7, 6, 8
    print *, 7, 6, 8 !-- !-- default=centre aligned when default

    !-- let's test that
    
    !-- for integers, there's another neat formatting option:
    print *, 1327
    print "(i0)", 1327  !-- "i0" means: "use as few spaces as possible"

    !-- let's test that

    !-- float works analogously to integer formatting but with 'f' instead of 'i'

    print "(2f8.5)", 3.1415926, 1.2345  !-- 2f8.5 = "2 floats with max. space of 8 but 5 decimal places (hence the 6 will be ommitted and a 0 added)
    print "(2f20.5)", 3.1415926, 1.2345 !-- notice the indentation due to length 20
    print "(2f5.3)", 3.1415926, 1.2345 !-- notice the rounding of the values and how there's no space between them?
    print "(2f5.3)", 3.1414926, 1.2345 !-- notice the rounding of the values and how there's no space between them?
    
    !-- let's test that

    !-- exponential notation works analogously:

    print "(e10.3)", 123.456
    print "(e20.4)", 123.456
    print "(e30.1)", 123.456, 456.789

    !-- let's test that

    !-- character string formatting with 'a'

    print "(2a8)", "Name", "Age"
    print *, "Name", "Age"  !-- notice the difference?
    print "(2a)", "Name", "Age"

    !-- let's test that

    !-- combining formatting

    print "(a13, i2)", "The answer is ", 42
    print "(a13 i2)", "The answer is ", 42 !-- works like this, too

    !-- let's test that

    !-- converting into string
    
    write (some_string, "(i5)") 42
    print "(a,a)", "The answer is ", adjustl(some_string)

    !-- let's test that

    !-- how to handle quotation marks for strings:

    print *, "You can print 'single quotes' if you use double quotes to denote the string!"
    print *, 'You can print "double quotes" if you use single quotes to denote the string!'
    print *, 'You can print both ''single quotes'' and "double quotes" this way by doubly denoting them!' 
    print *, "It also works the other way around: ""double quotes"" and 'single quotes'!"
    print "('You can also place the text in the formatter! ' i2)", 23
    print "('If you don''t want to count or estimate the amount of places needed for a number, you can use ""i0"": ' i0)", 1327

    !-- let's test that

    !-- print formatted output using labels:

    do n = 1, 10
        print 100, n, n * 8 !-- we can use numbers like "100" as labels
        100 format(i2, " * 8 = ", i3)   !-- here, we specify the label format
    end do

    !-- let's test that

end program basicIO