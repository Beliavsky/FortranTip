module bounds_mod
implicit none
type :: vec
   real :: x(0:2)
end type vec
character (len=*), parameter :: fmt = "(a35,*(1x,i4))"
contains
subroutine print_bounds_lb_arg(x,lb) ! lower bound passed
integer, intent(in) :: lb
real   , intent(in) :: x(lb:)
print fmt,"in print_bounds_lb_arg, bounds =",lbound(x),ubound(x)
end subroutine print_bounds_lb_arg

subroutine print_bounds(x) ! lower bound 1 by default
real, intent(in) :: x(:)
print fmt,"in print_bounds, bounds =",lbound(x),ubound(x)
end subroutine print_bounds
!
subroutine print_bounds_0(x) ! lower bound 0
real, intent(in) :: x(0:)
print fmt,"in print_bounds_0, bounds =",lbound(x),ubound(x)
end subroutine print_bounds_0
!
subroutine print_bounds_mat_3_5(x) ! lower bounds 3, 5
real, intent(in) :: x(3:,5:)
print fmt,"in print_bounds_0, bounds =",lbound(x),ubound(x)
end subroutine print_bounds_mat_3_5
!
subroutine print_bounds_vec(v) ! lower bounds of array component
type(vec), intent(in) :: v     ! are preserved
print fmt,"in print_bounds_vec, v%x bounds =",lbound(v%x),ubound(v%x)
end subroutine print_bounds_vec
end module bounds_mod
!
program main
use bounds_mod
implicit none
real :: x(0:3),xmat(-1:5,2:4)
type(vec) :: v
print fmt,"in main, bounds =",lbound(x),ubound(x)
call print_bounds(x)
call print_bounds_0(x)
call print_bounds_lb_arg(x,lb=0) ! pass lower bound
print fmt,"in main, bounds =",lbound(xmat),ubound(xmat)
call print_bounds_mat_3_5(xmat)
print fmt,"in main, v%x bounds =",lbound(v%x),ubound(v%x)
call print_bounds_vec(v)
print "(/,a)","calling print_bounds with v%x"
call print_bounds(v%x)
end program main
! output:
!                   in main, bounds =    0    3
!           in print_bounds, bounds =    1    4
!         in print_bounds_0, bounds =    0    3
!    in print_bounds_lb_arg, bounds =    0    3
!                   in main, bounds =   -1    2    5    4
!         in print_bounds_0, bounds =    3    5    9    7
!               in main, v%x bounds =    0    2
!   in print_bounds_vec, v%x bounds =    0    2