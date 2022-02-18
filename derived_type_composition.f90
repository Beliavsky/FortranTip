module m
implicit none
type :: date_t
   integer :: year, month, day
end type date_t
type :: daily_temperature_t
   type(date_t) :: date
   real :: high, low
end type daily_temperature_t
end module m
!
program derived_type_composition
use m, only: daily_temperature_t, date_t
implicit none
type(daily_temperature_t) :: x
character (len=*), parameter :: fmt = "(*(1x,g0))"
! use default constructors of daily_temperature_t and date_t
x = daily_temperature_t(date_t(2022,2,12),high=30.0,low=10.0)
print fmt,x ! 2022 2 12 30.0000000 10.0000000
print fmt,x%date%year ! 2022
end program derived_type_composition