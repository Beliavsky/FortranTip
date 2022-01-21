module iso_fortran_env ! user-defined
implicit none
integer, parameter :: output_unit = -1
end module iso_fortran_env
!
module sin_mod
implicit none
contains
function sin(x) result(y)
! override sin() intrinsic
real, intent(in) :: x
real             :: y
y = 10.0
end function sin
end module sin_mod
!
module m
implicit none
contains
subroutine replacements()
use iso_fortran_env
use sin_mod
print*,"in replacements()"
print*,"output_unit =",output_unit
print*,"sin(0.0) =",sin(0.0)
print*
end subroutine replacements
!
subroutine normal()
use, intrinsic :: iso_fortran_env, only: output_unit
intrinsic :: sin ! optional since sin_mod not USEd
print*,"in normal()"
print*,"output_unit =",output_unit
print*,"sin(0.0) =",sin(0.0)
end subroutine normal
end module m
!
program test_intrinsic
use m, only: replacements, normal
implicit none
call replacements()
call normal()
end program test_intrinsic
!  in replacements()
!  output_unit =          -1
!  sin(0.0) =   10.0000000    
! 
!  in normal()
!  output_unit =           6
!  sin(0.0) =   0.00000000
