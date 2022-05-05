program test_sum_vec ! GitHub FortranTip xsum_vec.f90
use iso_c_binding, only: c_double, c_int
implicit none
interface
pure function sum_vec(x, n) result(xsum) bind(c)
import c_double, c_int
integer(kind=c_int), intent(in), value :: n
real(kind=c_double), intent(in)        :: x(n)
real(kind=c_double)                    :: xsum
end function sum_vec
end interface
integer(kind=c_int), parameter :: n = 3
real(kind=c_double) :: x(n) = real([10,20,30], kind=c_double)
print "(*(1x,f0.1))",x,sum_vec(x,n) ! 10.0 20.0 30.0 60.0
end program test_sum_vec
! compile with 
! gcc -c -o sum_vec.o sum_vec.c
! gfortran sum_vec.o xsum_vec.f90