program read_line
implicit none
integer :: iu
integer          , parameter :: nlines = 6
character (len=*), parameter :: fname = "scientists.txt"
character (len=100)          :: text,lines(nlines)
integer                      :: i
lines(1) = "Marie Curie"
lines(2) = "Eugene Wigner"
lines(3) = "Landau, Lev"    ! comma or space is a delimiter
lines(4) = "'Enrico Fermi'" ! text inside quotes treated as 1 field
lines(5) = "3/31/2022"      ! / terminates a record, except in quotes
lines(6) = "'3/31/2022'"
open (newunit=iu,file=fname,action="write",status="replace")
write (iu,"(a)") lines ! writes one element of lines(:) to each line
close (iu)
open (newunit=iu,file=fname,action="read",status="old")
print*,"line followed by text read -- first read uses (a) format"
do i=1,nlines
   if (i == 1) then ! use "(a)" format to print 1st line
      read (iu,"(a)") text
   else             ! use list-directed write for other lines
      read (iu,*) text
   end if
   print "(a)","'" // trim(lines(i)) // "' '" // trim(text) // "'"
end do
end program read_line
! output:
! format = "(a)"
!  Marie Curie
! 
! format = * (list-directed)
!  Eugene
!  Landau
!  Enrico Fermi
!  3
!  3/31/2022