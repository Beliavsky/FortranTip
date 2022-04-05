program scratch_file
implicit none
integer, parameter :: iu = 10, n = 25
integer :: i,isq(n)
character (len=100) :: file_name
! no name given for scratch file below
open (unit=iu,status="scratch",action="readwrite")
write (iu,"(i0)") (10*i**2,i=1,n) ! write data
inquire (unit=iu,name=file_name)
print*,"wrote to " // trim(file_name)
! rewind file so it can be read, since it cannot be
! reopened after it is closed
rewind (iu) 
read (iu,*) isq
print*,isq([1,n]) ! 10 6250
end program scratch_file
! Intel Fortran sample output:
! wrote to C:\Users\name\AppData\Local\Temp\FORC5A7.tmp
!          10        6250