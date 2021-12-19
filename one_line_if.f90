! In addition to if-elseif, Fortran has a one-line if
! if (condition) executable_statement

program one_line_if
implicit none
integer :: i
do i=-1,1
   if (i /= 0) print*,i,1/i ! equivalent to below
   if (i /= 0) then
      print*,i,1/i
   end if
end do
end program one_line_if
! output:
! -1  -1
! -1  -1
!  1   1
!  1   1