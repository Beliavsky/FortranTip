program open_file
implicit none
character (len=*), parameter :: fname = "temp.txt"
integer, parameter :: iu = 10
integer :: ierr
open (unit=iu,file=fname,action="write")
! compilers will typically overwrite temp.txt if it exists, 
! but this is not mandated with unspecified STATUS
write (iu,*) "a"
close (iu)
open (unit=iu,file=fname,action="write",status="replace")
write (iu,*) "b"
close (iu)
open (unit=iu,file=fname,action="write",status="new",iostat=ierr)
if (ierr == 0) then
   write (iu,*) "c"
   close (iu)
else
   write (*,*) "file " // fname // " already connected"
end if
open (unit=iu,file=fname,action="write",status="new")
write (iu,*) "c"
end program open_file
! gfortran output (ifort, g95, flang similar):
!  file temp.txt already connected
! At line 21 of file open_file.f90 (unit = 10)
! Fortran runtime error: Cannot open file 'temp.txt': File exists
