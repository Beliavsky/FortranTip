module m
implicit none
contains
function factorial(n) result(ifac)
integer, intent(in) :: n
integer :: ifac
integer :: i, j
data i/1/
do j=1,n
   i = i*j
end do
ifac = i
end function factorial
end module m
!
program main
use m
implicit none
print*,factorial(3), factorial(4)
end program main
