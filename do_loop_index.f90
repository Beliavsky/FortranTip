! The loop variable equals the upper bound plus the stride
! after normal completion of a loop
program loop_stride
implicit none
integer :: i
do i=1,3
  if (i > 1) exit
end do
print*,i ! 2
do i=1,3
  continue ! placeholder
end do
print*,i ! 4
do i=1,3,2
  continue
end do
print*,i ! 5
end program loop_stride
