module test_assumed_type_mod
implicit none
contains
pure function same_shape(x,y) result(tf)
! test if two array arguments of arbitrary type
! have the same shape
type(*), intent(in) :: x(..),y(..)
! assumed type, assumed rank arguments
! code also works with class(*) instead of type(*)
! SELECT TYPE is unavailable for type(*) variables
logical              :: tf
if (rank(x) /= rank(y)) then
   tf = .false. ! not same shape if ranks differ
else
   tf = all(shape(x) == shape(y))
end if
end function same_shape
end module test_assumed_type_mod
!
program test_assumed_type
use test_assumed_type_mod, only: same_shape
implicit none
type :: date
   integer :: year, month, day
end type date
integer    :: i(2),j(2,1)
real       :: x(2),y(2,1)
logical    :: b(3)
type(date) :: d(2)
print*,same_shape(i,x),same_shape(i,b), &
       same_shape(x,b),same_shape(i,d)
print*,same_shape(j,i),same_shape(j,x), &
       same_shape(j,y)
end program test_assumed_type
! output with gfortran and Intel Fortran:
! T F F T
! F F T