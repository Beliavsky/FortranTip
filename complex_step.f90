implicit none ! GitHub FortranTip complex_step.f90
integer, parameter :: dp = kind(1.0d0)
real(kind=dp), parameter :: h = 1.0d-10
! compute exp'(x) at x = 0, which is 1.0
! using complex step and central finite difference
print*,aimag(exp(cmplx(0.0_dp, h, kind=dp))/h)
print*,(exp(h)-exp(-h))/(2*h)
end
! output:
!  1.0000000000000000     
!  1.0000000827403710