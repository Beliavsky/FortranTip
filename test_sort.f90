program test_sort ! GitHub FortranTip test_sort.f90
use iso_c_binding, only: c_int, c_float
implicit none
!
interface
subroutine sort_f(n, x) bind(c)
import c_int, c_float
integer(kind=c_int), intent(in), value :: n
real(kind=c_float) , intent(in out)    :: x(n)
end subroutine sort_f
end interface
!
real(kind=c_float) :: x(5)
call random_number(x)
print "('original',*(1x,f5.3))", x
call sort_f(size(x),x)
print "('sorted',2x,*(1x,f5.3))", x
end program test_sort
! Compile with
!   g++ -c -std=c++20 sort.cpp
!   gfortran sort.o test_sort.f90
! sample output:
!   original 0.521 0.213 0.669 0.835 0.915
!   sorted   0.213 0.521 0.669 0.835 0.915

