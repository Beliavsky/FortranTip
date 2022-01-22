module factorial_mod
implicit none
contains
pure function factorial(n) result(fac)
! n unchanged upon return
integer, value :: n
integer        :: fac
if (n < 2) then
   fac = 1
   return
end if
fac = n
do
   n = n - 1
   if (n < 2) return
   fac = fac * n
end do
end function factorial
!
function factorial_impure(n) result(fac)
! poor style -- n changed upon return
integer :: n
integer :: fac
if (n < 2) then
   fac = 1
   return
end if
fac = n
do
   n = n - 1
   if (n < 2) return
   fac = fac * n
end do
end function factorial_impure
end module factorial_mod
!
program test_factorial
use factorial_mod
implicit none
integer :: n = 4
print*,factorial(n) ! 24
print*,n ! 4
print*,factorial_impure(n) ! 24
print*,n ! 1
end program test_factorial