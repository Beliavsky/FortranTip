program loop_index
implicit none
integer :: i
do i=1,3
   call sub(i) ! invalid since this changes i
   print*,i,i**2
end do
contains
subroutine sub(i)
integer :: i
! gfortran gives an error and ifort warns if
! i is declared intent(in out)
i = 2*i
end subroutine sub
end program loop_index
! gfortran, ifort, and lfortran output:
!            2           4
!            6          36
! flang and g95 output:
!  2 4
!  6 36
!  14 196
