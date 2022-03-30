program main
implicit none
character (len=100) :: text
integer :: i,j,ierr
text = "42 abc"
i = 7
j = 8
block ! itmp and jtmp not used outside block
   integer :: itmp, jtmp
   ! try to read two integers
   read (text,*,iostat=ierr) itmp,jtmp
   if (ierr == 0) then
      i = itmp
      j = jtmp
   else ! try to read one integer
      read (text,*,iostat=ierr) itmp
      if (ierr == 0) i = itmp
   end if
end block
print*,"i, j =",i,j
end program main
! output with gfortran and ifort:
! i, j = 42 8
