! The READ statement is used to get data from the terminal or a file.
! To handle errors, set the iostat in the READ and check if it is zero.
! This program prompts the user for integers, one at a time, and prints
! their sum.
program sum_int
implicit none
integer :: i,ierr,isum
isum = 0
do
   print*,"enter an integer, 0 to stop"
   read (*,*,iostat=ierr) i
   if (ierr /= 0) then
      write (*,*) "invalid input"
      cycle ! return to beginning of loop
   end if
   if (i == 0) exit
   isum = isum + i
end do
print*,"sum is",isum
end program sum_int

