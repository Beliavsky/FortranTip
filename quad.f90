program main
use iso_fortran_env, only: real128
implicit none
integer, parameter :: qp = real128 
! integer, parameter :: qp = selected_real_kind(33, 4931) ! alternative
real(kind=real128), parameter :: x = 1.1e4932_qp
! line below is non-standard because of real*16 and Q
real*16, parameter :: y = 1.1Q+4932
print*,x,y
end program man
