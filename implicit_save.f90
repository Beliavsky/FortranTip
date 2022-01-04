module save_mod
implicit none
contains
function circle_area(radius) result(area)
real, intent(in) :: radius
real             :: area
real             :: pi = 3.14159
! real, parameter :: pi = 3.14159 ! better to write this
area = pi*radius**2
end function circle_area
!
function bad_factorial(n) result(nfac)
integer, intent(in) :: n
integer             :: nfac
integer             :: j
integer             :: i = 1 ! has same effect as line below
! integer, save       :: i = 1
do j=2,n
   i = i*j
end do
nfac = i
end function bad_factorial
!
function factorial(n) result(nfac)
integer, intent(in) :: n
integer             :: nfac
integer             :: i,j
i = 1
do j=2,n
   i = i*j
end do
nfac = i
end function factorial
end module save_mod
!
program test_save
use save_mod, only: factorial, bad_factorial
implicit none
print*,bad_factorial(3),bad_factorial(3) ! 6 36
print*,factorial(3),factorial(3) ! 6 6
end program test_save