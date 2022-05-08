program random_normal ! GitHub FortranTip xnormal.f90
use iso_c_binding, only: c_int, c_double
implicit none
!
interface
subroutine normal_vec(seed, n, x) bind(c)
import c_int, c_double
integer(kind=c_int), intent(in), value :: seed, n
real(kind=c_double)                    :: x(n)
end subroutine normal_vec
end interface
!
integer :: seed
integer, parameter :: n = 5
real(kind=c_double) :: x(n)
!
do seed=1,3
   call normal_vec(seed,n,x)
   print "(*(1x,f7.4))",x
end do
end program random_normal
! Compile on WSL2 with
! g++ -c -std=c++17 normal_array.cpp
! gfortran -c xnormal.f90
! gfortran normal_array.o xnormal.o
! output:
!  -0.1220 -1.0868  0.6843 -1.0752  0.0333
!   0.3526 -0.2002 -1.9825 -0.8651  0.9774
!  -1.6147 -1.3718 -0.2794  0.0946  0.2605