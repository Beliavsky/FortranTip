module m
implicit none
contains
subroutine double(i,i2)
integer, intent(in)  :: i
integer, intent(out) :: i2
print*,"entering double, i =",i
i2 = 2*i
print*,"leaving double, i =",i
end subroutine double
end module m
!
program overlapping_arg
use m, only: double
implicit none
integer :: j
j = 3
call double(j,j) ! non-standard: gfortran warns
! Same actual argument associated with INTENT(IN) argument 'i' 
! and INTENT(OUT) argument 'i2' at (1)
print*,"(1) in main, j =",j
call double((j),j) ! standard-conforming
print*,"(2) in main, j =",j
end program overlapping_arg
! output
!  entering double, i = 3
!  leaving double, i = 6
!  (1) in main, j = 6
!  entering double, i = 6
!  leaving double, i = 6
!  (2) in main, j = 12