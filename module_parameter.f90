! A physical or mathematical constant such as pi that will be used 
! in many parts of a program should be defined as a PARAMETER in a 
! module that is USEd where needed. In the code below pi is used both in 
! module m and the main program. One should declare a module
! PRIVATE and list as PUBLIC the entities that will be referenced
! outside the module. Module entities are public by default.
!
module constants_mod
implicit none
private
public :: pi
real, parameter :: pi = 3.14159
end module constants_mod
!
module m
use constants_mod, only: pi
implicit none
private
public :: area_circle
contains
pure elemental function area_circle(radius) result(area)
real, intent(in) :: radius
real             :: area
area = pi*radius**2
end function area_circle
end module m
!
program main
use constants_mod, only: pi
use m            , only: area_circle
implicit none
real, parameter :: radius = 10.0
print*,"circumference, area =",2*pi*radius,area_circle(radius)
! output:  circumference, area =   62.8318024       314.158997
end program main
