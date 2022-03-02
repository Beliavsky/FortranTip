module scope_mod
implicit none
character (len=*), parameter :: fmt_ci = "(a,*(1x,i0))"
integer :: i,j,m ! module variables
contains
subroutine print_twice_powers(i) ! module procedure
integer, intent(in) :: i
integer             :: j
! i and j override the module variables
j = 2*i
print fmt_ci,"in print_twice_powers, i,j=",i,j
call print_powers(j)
print fmt_ci,"leaving print_twice_powers, i,j=",i,j
contains
!
subroutine print_powers(i) ! internal procedure
integer, intent(in) :: i
integer             :: j,k
! i and j override i and j in 
! print_twice_powers
do k=2,4
   j = i**k
   print "(i0,'^',i0,' = ',i0)",i,k,j
end do
m = j ! sets the module variable m
end subroutine print_powers
!
end subroutine print_twice_powers
end module scope_mod
!
program test_scope
use scope_mod, only: m, fmt_ci, print_twice_powers
i = 4
j = 9
m = 16
print fmt_ci,"in main, i,j,m=",i,j,m ! 4 9 16
call print_twice_powers(i)
print*,"returned from print_twice_powers"
print fmt_ci,"in main, i,j,m=",i,j,m ! 4 9 4096
! i and j are local variables distinct 
! from those in module
end program test_scope
! output:
! in main, i,j,m= 4 9 16
! in print_twice_powers, i,j= 4 8
! 8^2 = 64
! 8^3 = 512
! 8^4 = 4096
! leaving print_twice_powers, i,j= 4 8
!  returned from print_twice_powers
! in main, i,j,m= 4 9 4096