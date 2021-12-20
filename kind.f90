! Although floating point variables can still be declared just "real"
! or "double precision" in Fortran, they should not be. Instead the KIND
! of real should be specified as a parameter that is used throughout the
! program. The code below can be made single or quadruple precision by
! using the appropriate definition of wp (working precision) in
! kind_mod. Note that the _wp suffix is used in the literal constants for pi and 10.0,
! since any literal constant without a suffix is considered single precision in
! Fortran, regardless of the number of digits provided.
! See https://fortran-lang.org/learn/best_practices/floating_point for more discussion.

module kind_mod
use iso_fortran_env, only: real128, real64, real32
implicit none
! integer, parameter :: wp = real32  ! single precision
integer, parameter :: wp = real64    ! double precision
! integer, parameter :: wp = real128 ! quadruple precision
end module kind_mod
!
module area_mod
use kind_mod, only: wp
real(kind=wp), parameter :: pi = 3.141592653589793238462643_wp
contains
pure elemental function area_circle(radius) result(area)
real(kind=wp), intent(in) :: radius
real(kind=wp)             :: area
area = pi*radius**2
end function area_circle
end module area_mod
!
program xkind
use kind_mod, only: wp
use area_mod, only: area_circle
implicit none
real(kind=wp), parameter :: radius = 10.0_wp
print*,area_circle(radius)
! output: 314.1592653589793
end program xkind
