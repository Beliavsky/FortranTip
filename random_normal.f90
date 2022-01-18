module random_normal_mod
implicit none
contains
impure elemental subroutine random_normal(ran_norm)
! adapted from https://jblevins.org/mirror/amiller/ran_norm.f90
real, intent(out) :: ran_norm ! normal variate
real, parameter :: s = 0.449871, t = -0.386595, a = 0.19600, &
      b = 0.25472, half = 0.5, r1 = 0.27597, r2 = 0.27846
real :: u, v, x, y, q
do
  call random_number(u)
  call random_number(v)
  v = 1.7156 * (v - half)
  x = u - s
  y = abs(v) - t
  q = x**2 + y*(a*y - b*x)
  if (q < r1) exit
  if (q > r2) cycle
  if (v**2 < -4.0*log(u)*u**2) exit
end do
ran_norm = v/u
end subroutine random_normal
end module random_normal_mod
!
program test_random_normal
use random_normal_mod
implicit none
integer, parameter :: n = 10**6, ncol = 3
integer :: i, k
real :: x(n,ncol)
character (len=*), parameter :: fmt = "(a8,*(1x,f6.3))"
call random_seed()
call random_normal(x)
print "(a8,*(1x,i6))", "power",(k,k=1,4)
print fmt, "true",real([0,1,0,3])
do i=1,ncol
   print fmt, "sim",(sum(x(:,i)**k)/n,k=1,4)
end do
end program test_random_normal
! sample output:
!    power      1      2      3      4
!   moment -0.001  0.999 -0.002  2.991
!   moment  0.001  1.000  0.003  2.995
!   moment -0.000  0.999 -0.002  2.997
