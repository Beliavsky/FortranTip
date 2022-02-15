module m
implicit none
character (len=*), parameter :: fmt = "(a35,*(1x,i4))"
contains
!
subroutine print_bounds_pointer(x)
real, intent(in out), pointer :: x(:)
print "(a)","entered print_bounds_pointer"
print fmt,"x bounds =",lbound(x),ubound(x)
end subroutine print_bounds_pointer
!
subroutine print_bounds(x1,x2,x3,x4,lb)
integer, intent(in)                  :: lb
real   , intent(in out), allocatable :: x1(:)
! remaining arguments are assumed-shape, so
! original bounds are not preserved
real   , intent(in)                  :: x2(:)
real   , intent(in)                  :: x3(0:)
real   , intent(in)                  :: x4(lb:)
print "(a)","entered print_bounds"
print fmt,"x1 bounds =",lbound(x1),ubound(x1)
print fmt,"x2 bounds =",lbound(x2),ubound(x2)
print fmt,"x3 bounds =",lbound(x3),ubound(x3)
print fmt,"x4 bounds =",lbound(x4),ubound(x4)
end subroutine print_bounds
end module m
!
program test_bounds
use m, only: fmt, print_bounds, print_bounds_pointer
implicit none
real, allocatable :: x(:)
real, pointer     :: p(:)
allocate (x(-2:3),p(-2:3))
print fmt,"x bounds =",lbound(x),ubound(x)
print fmt,"p bounds =",lbound(p),ubound(p)
call print_bounds(x,x,x,x,8)
call print_bounds_pointer(p)
end program test_bounds
! output:
!                          x bounds =   -2    3
!                          p bounds =   -2    3
! entered print_bounds
!                         x1 bounds =   -2    3
!                         x2 bounds =    1    6
!                         x3 bounds =    0    5
!                         x4 bounds =    8   13
! entered print_bounds_pointer
!                          x bounds =   -2    3
