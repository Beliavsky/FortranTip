! adapted from "I’ve Come Here For An Argument, Side 2"
! https://stevelionel.com/drfortran/
subroutine sub(i)
integer :: i
! gfortran gives compile-time error for program if i is intent(in out)
print*,"entering sub, i=",i
if (i > 2) i = i + 1
print*,"exiting sub, i=",i
end subroutine sub

program main
implicit none
integer :: i = 3
call sub(i) ! valid
call sub(3) ! likely to cause "access violation" or "segmentation fault"
end program main
