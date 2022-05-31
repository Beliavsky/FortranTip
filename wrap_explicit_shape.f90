module m ! GitHub FortranTip wrap_explicit_shape.f90
implicit none
contains
!
function dot_assumed(v,w) result(vw) ! Fortran 90 style
! wrapper with assumed shape arguments for dot
integer, intent(in) :: v(:) ! (n)
integer, intent(in) :: w(:) ! (n)
integer             :: vw
integer             :: n
n = size(v)
if (size(w) == n) then
   vw = dot(n,v,w)
else
   error stop "in dot_assumed, size(v) /= size(w)"
end if
end function dot_assumed
!
function dot(n,v,w) result(vw)    ! Fortran 77 style
integer, intent(in) :: n          ! sizes passed as argument
integer, intent(in) :: v(n), w(n) ! explicit shape arguments
integer             :: vw
vw = sum(v*w)
end function dot
end module m
!
program main
use m, only: dot, dot_assumed
implicit none
integer, parameter :: n = 3
integer :: v(n), w(n)
v = [10,20,30] 
w = [4,5,6]
print*,dot(n,v,w),dot_assumed(v,w) ! 320 320
! line below uses sequence association to pass v(2:3) and w(2:3)
print*,dot(n-1,v(2),w(2)) ! 280 = 20*5 + 30*6
end program main
