module m
implicit none
private
public :: square_cube,powers,powers_dt,powers_2_3
type square_cube
   integer :: isquare,icube
end type square_cube
contains
! subroutine with multiple intent(out) arguments
subroutine powers(i,isquare,icube)
integer, intent(in)  :: i
integer, intent(out) :: isquare,icube
isquare = i**2
icube   = i*isquare
end subroutine powers
! function returning derived type with multple components
function powers_dt(i) result(res)
integer, intent(in) :: i
type(square_cube)   :: res
res%isquare = i**2
res%icube   = i*res%isquare
end function powers_dt
! function returning an array. This approach is arguably worse
! because it's not clear from the name what 
! p_2_3(1) and p_2_3(2) refer to. It's also restricted to 
! returning values of the same type.
function powers_2_3(i) result(p_2_3)
integer, intent(in) :: i
integer             :: p_2_3(2)
p_2_3(1) = i**2
p_2_3(2) = p_2_3(1)*i
end function powers_2_3
!
end module m

program main
use m, only: powers,powers_dt,square_cube,powers_2_3
implicit none
integer, parameter :: i = 4
integer            :: isquare,icube,pow(2)
type(square_cube)  :: dt
call powers(i,isquare,icube) ! return results in isquare and icube
dt = powers_dt(i) ! return a derived type with components isquare and icube
pow = powers_2_3(i)
print*,isquare,icube ! 16 64
print*,dt%isquare,dt%icube ! 16 64
print*,dt ! 16 64
! can print a whole derived type when it has scalar components
print*,pow ! 16 64
end program main
