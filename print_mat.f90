module m ! GitHub FortranTip print_mat.f90
implicit none
contains
subroutine print_matrix(n1,n2,mat)
integer, intent(in) :: n1, n2
integer, intent(in) :: mat(n1,n2)
integer             :: i1
do i1=1,n1
   print "(*(1x,i4))", mat(i1,:)
end do
print*
end subroutine print_matrix
end module m
!
program main
use m, only: print_matrix
integer, parameter :: n = 6
integer            :: v(n)
v = [10,20,30,11,21,31]
call print_matrix(2,3,v) ! pass v as 2x3 matrix
call print_matrix(3,2,v) ! pass v as 3x2 matrix
call print_matrix(2,2,v(3)) ! pass v(3:6) as 2x2 matrix
! line below is clearer than line above
call print_matrix(2,2,v(3:n)) 
! If the actual argument has more elements than
! the dummy argument, the excess elements are ignored.
call print_matrix(2,2,v) ! pass v(1:4) as 2x2 matrix
end program main
! output:
!    10   30   21
!    20   11   31
! 
!    10   11
!    20   21
!    30   31
! 
!    30   21
!    11   31
! 
!    30   21
!    11   31
! 
!    10   30
!    20   11