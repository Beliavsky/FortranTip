module time_mod
implicit none
private
public :: time, display
type time
   integer :: hour, minute
   integer :: second = 0 ! default value
end type time
contains
!
subroutine display(t)
type(time), intent(in) :: t
write (*,"(i2.2,2(':',i2.2))") t%hour,t%minute,t%second
end subroutine display
!
end module time_mod
!
program test_time
use time_mod, only: time, display
implicit none
call display(time(6,20,59)) ! 06:20:59
call display(time(5,30))    ! 05:30:00
end program test_time