!-- we can use modules to encapsulate code in order to keep it DRY
!-- functions, subroutines, types  (more about these in the next chapters), global variables etc. belong in modules
!-- you should always declare modules first in files, so the compiler can create the according .mod file
module some_module
    implicit none 

    real, parameter :: PI = 3.141592653589 !-- PI is now a global variable for all programs that include some_module
end module some_module

program fortranModules
    
    !-- first thing in a programme? Include modules!

    use some_module
    implicit none

   print *, PI

end program fortranModules
