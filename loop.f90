! Demonstrate a do loop
program loop
implicit none
integer :: i,ssq
ssq = 0
do i=1,5
   ssq = ssq + i**2
end do
print*,"sum of squares is ",ssq ! 1 + 4 + 9 + 16 + 25 = 55
end program loop