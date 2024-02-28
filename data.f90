module m ! GitHub FortranTip data.f90
implicit none
contains
function factorial(n) result(ifac)
! buggy code
integer, intent(in) :: n
integer :: ifac
integer :: i, j
data i/1/ ! write "i=1" instead
do j=2,n
   i = i*j
end do
ifac = i
end function factorial
end module m
!
program main
use m
implicit none
print*,factorial(3), factorial(4) ! gives 6 144
end program main
