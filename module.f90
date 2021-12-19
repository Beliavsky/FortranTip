! Fortran procedures should be defined in modules to
! ensure that interfaces are checked.
module m
implicit none ! enforces implicit none in all procedures of the module
contains
integer function area(length,width)
integer, intent(in) :: length,width
area = length*width
end function area
end module m
!
program main
use m
implicit none
print*,area(3,4) ! 12
end program main