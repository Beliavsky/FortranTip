module m
implicit none
contains
pure function sqrt_int(i) result(y)
integer, intent(in) :: i
real                :: y
if (i < 0) error stop "need i >= 0 in sqrt_int"
! plain stop not allowed in pure function
y = sqrt(real(i))
end function sqrt_int
end module m
!
program main
use m, only: sqrt_int
implicit none
print*,sqrt_int(-1)
stop "normal termination"
end program main
! output:
! ERROR STOP need i >= 0 in sqrt_int
