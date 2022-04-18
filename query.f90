module m ! query.f90 at GitHub FortranTip
implicit none
type :: date_t
   integer :: year, month, day
end type date_t
!
type :: daily_temperature
   character (len=20) :: city
   type(date_t)       :: date
   real               :: high,low
end type daily_temperature
end module m
!
program main
use m, only: daily_temperature
implicit none
type(daily_temperature), allocatable :: tdata(:),subset(:)
allocate (tdata(1000))
! read tdata here
subset = pack(tdata,tdata%date%year==2000) ! data for year 2000
subset = pack(tdata,tdata%date%month==1)   ! data for January
subset = pack(tdata,tdata%city=="Paris")   ! data for Paris
! data for Paris in January
subset = pack(tdata,tdata%city=="Paris" .and. tdata%date%month==1) 
subset = pack(tdata,tdata%low<0) ! data for days with low temp < 0
end program main