module m
private
contains
subroutine hello() ! private subroutine not called in module
print*,"hello"
end subroutine hello
end module m
!
program main
use m
implicit none
integer :: i,j ! j is not used
real, parameter :: pi = 3.14159 ! pi is not used
i = 2
print*,i
end program main
! output of gfortran -Werror=unused-variable -Werror=unused-parameter \
! -Werror=unused-function warnings.f90
! warnings.f90:12:14:
! 
!    12 | integer :: i,j ! j is not used
!       |              1
! Error: Unused variable 'j' declared at (1) [-Werror=unused-variable]
! warnings.f90:13:21:
! 
!    13 | real, parameter :: pi = 3.14159
!       |                     1
! Error: Unused parameter 'pi' declared at (1) [-Werror=unused-parameter]
! warnings.f90:4:16:
! 
!     4 | subroutine hello() ! private subroutine not called in module
!       |                ^
! Error: 'hello' defined but not used [-Werror=unused-function]
! f951.exe: some warnings being treated as errors