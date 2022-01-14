module date_mod
implicit none
type date
   integer :: year, month, day
end type date
contains
function str(dt) result(str_dt)
type(date), intent(in) :: dt
character (len=10)     :: str_dt
write (str_dt,"(i4.4,2('-',i2.2))") dt%year,dt%month,dt%day
end function str
end module date_mod
!
module time_mod
implicit none
type time
   integer :: hour, minute, second
end type time
contains
function str(dt) result(str_dt)
type(time), intent(in) :: dt
character (len=8)     :: str_dt
write (str_dt,"(*(i2.2,:,':'))") dt%hour,dt%minute,dt%second
end function str
end module time_mod
!
program test_rename ! rename module imports to avoid name conflict
use date_mod, only: date, date_str => str
use time_mod, time_str => str ! imports all time_mod entities, renames str
implicit none
write (*,"(a,1x,a)") date_str(date(2022,1,12)),time_str(time(7,31,45))
! output: 2022-01-12 07:31:45
end program test_rename