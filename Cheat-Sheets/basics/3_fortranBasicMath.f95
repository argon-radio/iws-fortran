program fortranBasicMath
    implicit none
    
    real :: float1, float2 = 1.111111111111111

    double precision :: double1 = 1.111111111111111
    double precision :: double2 = 1.111111111111111

    double precision :: double3 = 1.111111111111111d+0
    double precision :: double4 = 1.111111111111111d+0

    real :: rand(1) !-- this is for how you can generate random number. Random numbers can only be real
    integer :: low = 1, high = 10

    print "(a8, i1)", "5 + 4 = ", 5 + 4
    print "(a8, i1)", "5 - 4 = ", 5 - 4
    print "(a8, i2)", "5 * 4 = ", 5 * 4
    print "(a8, i1)", "5 / 4 = ", (5 / 4) !-- warnings can be fixed like so: (real(5) / 4)
    print "(a8, i1)", "5 % 4 = ", mod(5, 4)
    print "(a8, i3)", "5 ** 4 = ", 5 ** 4

    !-- let's check precision:

    print "(f17.15)", float1 + float2
    print "(f17.15)", double1 + double2
    print "(f17.15)", double3 + double4

    !-- create random number:
    call random_number(rand)
    print "(a15,i2)", "Random number: ", low + floor((high + 1 - low) * rand) !-- generate random number between low and high

    print "(a10, i1)", "ABS(-1) = ", ABS(-1)
    print "(a11, f3.1)", "SQRT(81) = ", SQRT(81.0)
    print "(a9, f7.5)", "EXP(1) = ", EXP(1.0)
    print "(a12, f7.5)", "LOG(2.71) = ", LOG(2.71)
    print "(a12, i1)", "INT(2.71) = ", INT(2.71)
    print "(a13, i1)", "NINT(2.71) = ", NINT(2.71)
    print "(a14, i1)", "FLOOR(2.71) = ", FLOOR(2.71)
    print "(a15, f3.1)", "MIN(2.7, 3.4) = ", MIN(2.7, 3.4)
    print "(a15, f3.1)", "MIN(2.7, 3.4) = ", MAX(2.7, 3.4)

    !-- the following functins use RAD instead of DEG!

    print "(a14, f3.1)", "SIN(1.5708) = ", SIN(1.5708)
    print "(a14, f13.10)", "COS(1.5708) = ", COS(1.5708)
    print "(a14, f18.10)", "TAN(1.5708) = ", TAN(1.5708)
    print "(a10, f3.1)", "ASIN(0) = ", ASIN(0.0)
    print "(a10, f3.1)", "ACOS(0) = ", ACOS(0.0)
    print "(a10, f3.1)", "ATAN(0) = ", ATAN(0.0)
    print "('int(-2.71) = ' i0)", int(-2.71)
    print "('nint(-2.71) = ' i0)", nint(-2.71)
    print "('ifix(2.71) = ' i0)", ifix(2.71)
    print "('ifix(-2.71) = ' i0)", ifix(-2.71)
    print "('dim(4,3) = ' i0)", dim(4,3)
    print "('idim(4,3) = ' i0)", idim(4,3)

end program fortranBasicMath
