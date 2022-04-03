module m
implicit none
contains
function sqrt_chk_bad(x) result(y)
real, intent(in) :: x
real             :: y
if (x < 0.0) then
   ! line below invalid if function invoked in
   ! PRINT or WRITE
   print*,"need x >= 0 in sqrt_chk_bad"
   y = -1.0
   return
end if
y = sqrt(x)
end function sqrt_chk_bad
!
pure function sqrt_chk(x) result(y)
! note that ERROR STOP is allowed in PURE function
real, intent(in) :: x
real             :: y
if (x < 0.0) error stop "need x >= 0 in sqrt_chk"
y = sqrt(x)
end function sqrt_chk
end module m
!
program main
use m
implicit none
print*,sqrt_chk_bad(-4.0)
end program main
! On Windows, Intel Fortran output:
!  need i >= 0 in sqrt_int
!   -1.000000
! With gfortran the program hangs.
! If the call to sqrt_chk_bad is replaced by a
! call to sqrt_chk, ifort and gfortran say
! need x >= 0 in sqrt_chk