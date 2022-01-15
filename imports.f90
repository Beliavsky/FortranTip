module constants_mod
implicit none
real, parameter :: pi = 3.14159
end module constants_mod
!
module circle_mod
use constants_mod
implicit none
contains
pure elemental function circle_area(r) result(area)
real, intent(in) :: r
real             :: area
area = pi*r**2
end function circle_area
end module circle_mod
!
program imports
use circle_mod ! imports circle_area and pi
! the lines below would clarify what is imported from where
! use circle_mod   , only: circle_area
! use constants_mod, only: pi
! OR
! use circle_mod, only: circle_area, pi
implicit none
real, parameter :: r = 10.0
print*,circle_area(r), pi*r**2 ! 314.1590 314.1590
end program imports