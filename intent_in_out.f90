! A procedure argument can be intent(in out), which means
! that it is an input that can be overwritten. Functions
! should not have such arguments, but subroutines often do.
! Intent(out) means the argument is set to uninitialized upon
! entering the procedure.
!
program intent_in_out
implicit none
real :: x(3)
x = [1.,4.,5.]
call normalize(x)
print*,x ! 0.1 0.4 0.5
contains
subroutine normalize(x)
! scale x so that sum(x) = 1.
real, intent(in out) :: x(:)
real                 :: xsum
xsum = sum(x)
if (xsum /= 0) x = x/xsum
end subroutine normalize
end program intent_in_out
