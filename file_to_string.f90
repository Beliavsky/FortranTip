program read_file_into_string
implicit none
character (len=*), parameter :: fname = "temp.txt"
integer :: i,ipos,iu,len_text
integer, parameter :: n = 10
character (len=:), allocatable :: text
! write data to file -- square roots
open (newunit=iu,file=fname,action="write")
write (iu,"(i0,1x,f0.4)") (i,sqrt(real(i)),i=1,n)
inquire(unit=iu,size=len_text) ! get file size
close (iu)
! allocate string large enough to hold file if possible
allocate (character (len=len_text) :: text)
open (newunit=iu,file=fname,action="read", &
      form="unformatted",access="stream")
read (iu) text ! read file into variable text
ipos = index(text,new_line("")) ! pos of first newline
print "('first line: ',a)","'" // text(1:ipos-1) // "'"
! find position of next-to-last newline character in text
ipos = index(text(:len_text-1),new_line(""),back=.true.)
print "('last line: ',a)", &
      "'" // text(ipos+1:len_text-1) // "'"
end program read_file_into_string
! output:
! first line: '1 1.0000'
! last line: '10 3.1623'