module circle_mod ! GitHub FortranTip xcircle.f90
use iso_c_binding, only: dp => c_double
implicit none
real(kind=dp), bind(c), protected :: pi = 3.14159265359_dp
real(kind=dp), bind(c) :: circumference
! circumference can be modified on the Fortran or C side
end module circle_mod

program main
use circle_mod, only: dp,pi,circumference
interface
!
function area_circle(radius) result(area) bind(c)
import dp
real(kind=dp), intent(in), value :: radius
real(kind=dp)                    :: area
end function area_circle
!
subroutine set_circumference(radius) bind(c)
import dp
real(kind=dp), intent(in), value :: radius
end subroutine set_circumference
!
end interface
real(kind=dp) :: radius = 10.0_dp
print*,"circle area =",area_circle(radius)
call set_circumference(radius)
print*,"circumference =",circumference
end program main
! Compile with