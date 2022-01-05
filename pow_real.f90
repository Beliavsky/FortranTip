program power
implicit none
integer, parameter :: n = 10**8, dp = kind(1.0d0)
real(kind=dp) :: x(n),t(3)
call random_number(x)
call cpu_time(t(1))
write (*,"(a20,f20.10)") "sum(x**2.0_dp) =",sum(x**2.0_dp)
call cpu_time(t(2))
write (*,"(a20,f20.10)") "sum(x**2) =",sum(x**2)
call cpu_time(t(3))
write (*,"(/,a10,*(1x,a10))") "method","x**2.0_dp","x**2"
write (*,"(a10,*(1x,f10.4))") "time",t(2:3) - t(1:2)
end program power
! gfortran -O0 output
!
!     sum(x**2.0_dp) = 33334073.2750587128
!          sum(x**2) = 33334073.2750587128
! 
!     method  x**2.0_dp       x**2
!       time     1.3281     0.1250
!
! for gfortran -O3 the times are the same 
! for x**2.0_dp and x**2