program main ! how to write a double precision constant
use iso_fortran_env, only: real64, real128
implicit none
integer, parameter :: dp = real64, qp = real128
real(kind=dp) :: pi  ! double precision
real(kind=qp) :: piq ! quadruple precision
pi =        3.14159265358979323846 ! single precision constant
print*,pi ! 3.1415927410125732 -- precision lost     
pi =        3.14159265358979323846d0 ! double precision constant
print*,pi ! 3.1415926535897931 -- precision retained    
pi = 3.14159265358979323846_dp ! double precision constant
print*,pi ! 3.1415926535897931 -- precision retained
! quadruple precision constant
piq =        3.1415926535897932384626433832795028841971_qp
print*,piq ! 3.14159265358979323846264338327950280
end program main
