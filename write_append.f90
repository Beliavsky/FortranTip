program write_append
implicit none
integer, parameter           :: iu = 10
character (len=*), parameter :: outfile = "temp.txt"
logical, parameter           :: delete_file = .true.
integer                      :: stat
logical                      :: exists
open (iu,file=outfile,action="write",status="new")
! status="new" means outfile must not already exist
write (iu,"('a')")
close (iu)
open(iu,file=outfile,action="write",status="replace")
! use status="replace" since outfile exists
! previous contents of outfile are overwritten
write (iu,"('b')")
close (iu)
open(iu,file=outfile,action="write",position="append")
! writes to unit iu will append outfile
write (iu,"('c')")
! outfile now has 'b' and 'c' on separate lines
if (delete_file) then
   close (iu)
   inquire (file=outfile,exist=exists) ! see if file exists
   if (exists) print "(a)",outfile // " exists"
   open (unit=iu,iostat=stat,file=outfile,status="old")
   if (stat == 0) close (iu,status="delete") ! delete file
   inquire (file=outfile,exist=exists)
   if (.not. exists) print "(a)","after deletion, " &
                          // outfile // " does not exist"
end if
end program write_append
! output:
! temp.txt exists
! after deletion, temp.txt does not exist