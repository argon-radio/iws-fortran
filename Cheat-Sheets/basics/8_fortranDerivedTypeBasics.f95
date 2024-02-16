module Student_mod
    implicit none 
    private
    public :: Student 
    
    !-- Fortran types are very similar to structs in C/C++ and less similar to classes in OOL
    
    type Student    !-- this type will only be visible in this program since it is not declared in a module
        character(len=30) :: name
        character(len=7) :: mat_num
        real :: avg_mark
        logical :: isEnrolled = .true. !-- yes, there's default values, too!
    end type Student
end module Student_mod

program fortranTypes
    use Student_mod
    implicit none


    type(Student), dimension(15) :: students !-- we can create arrays of this type
    type(Student) :: anna    !-- we can instantiate single instances of the type
    type(Student) :: bob 
    type(Student) :: caroline
    
    anna%name = "Anna"  !-- access the type's "attributes" with the '%' sign
    anna%mat_num = "1234567"
    anna%avg_mark = 2.3

    bob = Student(name="Bob", mat_num="7654321", avg_mark=2.1) !-- much like a constructor call in OOL!

    caroline = Student("Caroline", "9876543", 1.0)    !-- even shorter

    students(1) = anna   !-- simply add derive types to according arrays
    students(2) = bob
    students(3) = caroline
    
    students(1)%avg_mark = 3.7  !-- we can also access them directly from an array

end program fortranTypes