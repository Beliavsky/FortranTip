program size_test
use iso_fortran_env, only: int64
implicit none
integer :: stat
integer(kind=int64) :: n
real, allocatable :: x(:)
n = 3d9
allocate(x(n))
print "(*(1x,i0))",n,size(x,kind=int64),size(x),huge(1)
end program
! Output on Windows with gfortran and Intel Fortran default options:
! 3000000000 3000000000 -1294967296 2147483647
! Output with gfortran -fdefault-integer-8 or ifort /integer-size:64:
! 3000000000 3000000000 3000000000 9223372036854775807