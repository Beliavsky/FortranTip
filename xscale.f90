program xscale ! GitHub FortranTip xscale.f90
use iso_c_binding, only: c_double, c_int
implicit none
interface
!
subroutine scale_vec(xscale, n, x) bind(c)
import c_double, c_int
real(kind=c_double), intent(in), value :: xscale
integer(kind=c_int), intent(in), value :: n
real(kind=c_double), intent(in out)    :: x(n)
end subroutine scale_vec
!
end interface
real(kind=c_double), allocatable  :: y(:)
y = [4.0_c_double, 9.0_c_double]
call scale_vec(10.0_c_double,size(y),y)
print "(*(1x,f0.1))", y ! 40.0 90.0
print*,"finished xscale.f90"
end program xscale
! compile with 
! gcc -c -o scale_vec.o scale_vec.c
! gfortran scale_vec.o xscale.f90