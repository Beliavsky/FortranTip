program test_ieee_arithmetic
use, intrinsic :: ieee_arithmetic
implicit none
character (len=20) :: fmt = "(a16,*(l9))"
integer, parameter :: wp = kind(1.0) ! same output for wp = kind(1.0d0)
real(kind=wp)      :: z,vec(6),NaN,t
z = 0.0_wp
t = tiny(z)
vec = [z/z,z/1.0_wp,-z/1.0_wp,1.0_wp/z,-1.0_wp/z,t/10]
print*,ieee_value(0.0,ieee_positive_inf),1.0/z ! 2 ways of geting +Inf
NaN = ieee_value(0.0,ieee_quiet_nan) ! get NaN
print*,"NaN == NaN?",NaN == NaN ! demonstrate that NaN /= NaN
print*
print "(19x,*(a9))","0.0/0.0","0.0/1.0","-0.0/1.0","1.0/0.0","-1.0/0.0","tiny/10"
print fmt,"ieee_is_nan"     ,ieee_is_nan(vec)
print fmt,"ieee_is_negative",ieee_is_negative(vec)
print fmt,"ieee_is_finite"  ,ieee_is_finite(vec)
print fmt,"ieee_is_normal"  ,ieee_is_normal(vec) 
end program test_ieee_arithmetic
! gfortran output:
!         Infinity         Infinity
! NaN == NaN? F
!
!                      0.0/0.0  0.0/1.0 -0.0/1.0  1.0/0.0 -1.0/0.0  tiny/10
!      ieee_is_nan        T        F        F        F        F        F
! ieee_is_negative        F        F        T        F        T        F
!   ieee_is_finite        F        T        T        F        F        T
!   ieee_is_normal        F        T        T        F        F        F
