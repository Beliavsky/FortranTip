! Demonstrate an infinite do loop with exit
program exit_loop
implicit none
integer :: i,ssq
ssq = 0 ! Fortran variables are not initialized to zero by default
i = 0
do
   i = i+1
   ssq = ssq + i**2
   if (ssq > 100) exit
end do  
print*,"sum of squares from 1 to ",i," is",ssq
! output: sum of squares from 1 to            7  is         140
end program exit_loop
