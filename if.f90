! Demonstrate if-elseif-endif
program if_elseif
implicit none
integer :: i
do i=-1,1
   print*,i
   if (i < 0) then
      print*,"negative"
   else if (i == 0) then
      print*,"zero"
   else
      print*,"positive"
   end if
   print*
end do
end program if_elseif

