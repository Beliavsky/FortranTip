module date_mod
implicit none
type date
   integer :: year, month, day
end type date
interface str
   module procedure date_str
end interface str
contains
function date_str(dt) result(str_dt)
type(date), intent(in) :: dt
character (len=10)     :: str_dt
write (str_dt,"(i4.4,2('-',i2.2))") dt%year,dt%month,dt%day
end function date_str
end module date_mod
!
module time_mod
implicit none
type time
   integer :: hour, minute, second
end type time
interface str
   module procedure time_str
end interface str
contains
function time_str(dt) result(str_dt)
type(time), intent(in) :: dt
character (len=10)     :: str_dt
write (str_dt,"(*(i2.2,:,':'))") dt%hour,dt%minute,dt%second
end function time_str
end module time_mod
!
program test_str
use date_mod, only: date, str
use time_mod, only: time, str
implicit none
write (*,"(a,1x,a)") str(date(2022,1,12)),str(time(7,31,45))
! output: 2022-01-12 07:31:45
end program test_str