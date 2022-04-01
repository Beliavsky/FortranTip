program list_directed_vs_line_by_line
implicit none
integer, parameter           :: nrows = 2, ncol = 3
integer                      :: i,ierr,iu,mat(nrows,ncol)
character (len=*), parameter :: fname="temp.txt",fmt_i="(*(1x,i0))"
character (len=100)          :: text
open (newunit=iu,file=fname,action="write",status="replace")
write (iu,fmt_i) 1,2,3
write (iu,fmt_i) 4,5 ! only two integers written to 2nd line
write (iu,fmt_i) 6,7,8
close (iu)
open (newunit=iu,file=fname,action="read",status="old")
print "(a)","list-directed read"
do i=1,nrows ! use list-directed read from unit
   read (iu,*) mat(i,:)
   print "('row ',i0,':',*(1x,i0))",i,mat(i,:)
end do
print*
rewind (iu)
print "(a)","read line by line"
do i=1,nrows
   read (iu,"(a)") text ! read line into string
   read (text,*,iostat=ierr) mat(i,:) ! read row from string
   if (ierr /= 0) then
      print "(a,i0,a,i0,a)","for line ",i," could not read ",ncol, &
            " integers from '" // trim(text) // "'"
      error stop
   end if
   print "('row ',i0,':',*(1x,i0))",i,mat(i,:)
end do
end program list_directed_vs_line_by_line
! output:
!  1 2 3
!  4 5 6
!  
!  1 2 3
! for line 2 could not read 3 integers from ' 4 5'