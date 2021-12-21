! Consider using unformatted stream I/O introduced in Fortran 2003 for 
! large data sets. Formatted I/O converts numerical data to and from ASCII 
! and is much slower than unformatted. This program times the writing and 
! reading of 10^7 double precision floats using formatted and unformatted
! stream I/O. The elapsed times of the program on my Windows PC compiled
! with gfortran -O3 are below. Unformatted stream write and read were
! 25 and 260 times faster than formatted.
!
!   formatted   formatted unformatted unformatted
!       write        read       write        read
!      7.5000      8.1100      0.2970      0.0310
! 
program stream_io
implicit none
integer, parameter :: wp = kind(1.0d0), n = 10**7
real(kind=wp)      :: x(n),xchk(n)
integer            :: iunit,irate,times(6)
call system_clock(count_rate = irate) ! get the # of clock ticks per second
print*,"n =",n
call random_number(x)
call system_clock(count = times(1))
! use formatted write and read
open (newunit=iunit,file="temp.txt",action="write",status="replace")
write (iunit,"(f0.16)") x
close (iunit)
call system_clock(count = times(2)) ! (times(2) - times(1))/irate = time elapsed (s) for formatted write
open (newunit=iunit,file="temp.txt",action="read",status="old")
read (iunit,*) xchk ! list-directed read with the * gets data from as many lines are needed
call system_clock(count = times(3))
print*,maxval(x-xchk),minval(x),maxval(x),minval(xchk),maxval(xchk) ! check that data read back correctly
call system_clock(count = times(4))
! use unformatted stream write and read
open (newunit=iunit,file="temp.bin",action="write",status="replace",form="unformatted",access="stream")
write (iunit) x ! no format supplied for unformatted I/O
close (iunit)
call system_clock(count = times(5))
open (newunit=iunit,file="temp.bin",action="read",status="old",form="unformatted",access="stream")
read (iunit) xchk
call system_clock(count = times(6))
print*,maxval(x-xchk),minval(x),maxval(x),minval(xchk),maxval(xchk)
write (*,"(/,*(a12))") "formatted","formatted","unformatted","unformatted"
write (*,"(*(a12))") "write","read","write","read"
write (*,"(*(f12.4))") [times(2:3)-times(1:2),times(5:6)-times(4:5)]/real(irate) ! count differences divided by count_rate equal seconds elapsed
end program stream_io