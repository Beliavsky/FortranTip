program main
use iso_fortran_env, only: iostat_end
implicit none
integer :: iu,i,ierr,j
character (len=*), parameter :: fmt_i = "(i0)"
character (len=100)          :: text
open (newunit=iu,file="temp.txt")
write (iu,fmt_i) (i,i=1,3)
rewind (iu) ! move position to beginning of file
write (iu,fmt_i) (2*i,i=1,3) 
! deletes previous data and writes 2 4 6 on successive lines
! position is now after last line written
backspace (iu) ! move file position to last line written
read (iu,*) j
print*,j ! 6
backspace (iu) ; backspace (iu) ; backspace (iu)
read (iu,*) j
print*,j ! 2
read (iu,*) ! skip a line -- move file position by 1 line
read (iu,*) j
print*,j ! 6
rewind (iu)
write (iu,"(i0/i0/a)") 10,20,"abc"
rewind (iu)
do
   read (iu,*,iostat=ierr) j
   if (ierr == 0) then
      print*,"j =",j
   else if (ierr == iostat_end) then
      stop "reached end of file"
   else
      backspace (iu)
      read (iu,"(a)") text
      stop "could not read integer from '" // trim(text) // "'"
   end if
end do
end program main
! output:
!            6
!            2
!            6
!  j =          10
!  j =          20
! STOP could not read integer from 'abc'