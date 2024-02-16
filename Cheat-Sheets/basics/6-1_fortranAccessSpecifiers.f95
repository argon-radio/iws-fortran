!-- no access-specifier means: everything in this module is public!

module fully_public_module
    implicit none
    
    integer, parameter :: a = 3

end module fully_public_module

!-- private access specifier means: everything below *and* above "private" in this module is private 
!-- thus, can only be accessed from within the module
!-- since everything in this module is now private, you should always place the label "private" on the very top as to make it clearer to understand!
module fully_private_module
    implicit none
     
    integer, parameter :: b = 4
    private !-- bad: place it on top!
    integer, parameter :: c = 5

end module fully_private_module

module partially_public_module
    implicit none
    private !-- well placed here
    public :: e, f !-- exceptions from the "everything shall be private" rule should be declared right here below "private"

    integer, parameter :: d = 6 !-- is private

    integer, parameter :: e = 7 !-- is public
    integer :: f = 8    !-- is public, too

end module partially_public_module

module partially_private_module
    implicit none 

    !-- everything is public by default

    integer, parameter :: g = 9 !-- public

    integer, parameter, private :: h = 10   !-- now this one is private
end module partially_private_module

program fortranTypeAccessSpecifiers
    use fully_public_module
    use fully_private_module
    use partially_public_module
    use partially_private_module
    implicit none

    print *, a 
    !print *, b     !-- won't work! \
    !print *, c     !-- won't work!  |- because they're private
    !print *, d     !-- won't work! /
    print *, e 
    print *, f 
    print *, g 
    !print *, h     !-- won't work
end program fortranTypeAccessSpecifiers
