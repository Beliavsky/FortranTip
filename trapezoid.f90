module funcs_mod
implicit none
private
public :: wp, f_real_real, square, cube
integer, parameter :: wp = kind(1.0d0)
!
interface ! defines a function signature
   pure function f_real_real(x) result(y)
   import wp
   implicit none
   real(kind=wp), intent(in) :: x
   real(kind=wp)             :: y
   end function f_real_real
end interface
!
contains
!
pure function square(x) result(y)
real(kind=wp), intent(in) :: x
real(kind=wp)             :: y
y = x**2
end function square
!
pure function cube(x) result(y)
real(kind=wp), intent(in) :: x
real(kind=wp)             :: y
y = x**3
end function cube
!
end module funcs_mod

module integral_mod
use funcs_mod, only: wp, f_real_real
implicit none
private
public :: integral
contains
!
pure function integral(f,a,b,n) result(y)
procedure(f_real_real)    :: f 
! f can be any function with f_real_real signature
real(kind=wp), intent(in) :: a,b
integer      , intent(in) :: n
real(kind=wp)             :: y
integer                   :: i
real(kind=wp)             :: x,h,fsum
h = (b-a)/(n-1)
x = a
fsum = 0.0
do i=1,n
   if (i == 1 .or. i == n) then
      fsum = fsum + f(x)/2
   else
      fsum = fsum + f(x)
   end if
   x = x + h
end do
y = h*fsum
end function integral
!
end module integral_mod
!
program test_procedure_arg
use integral_mod, only: integral
use funcs_mod   , only: wp, square, cube
implicit none
real(kind=wp) :: a,b
integer       :: n
n = 10**6
a = 0.0_wp
b = 10.0_wp
print "(*(f12.6))", integral(square,a,b,n),integral(cube,a,b,n) 
end program test_procedure_arg
! output:
!  333.333333 2500.000000
