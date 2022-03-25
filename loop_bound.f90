program loop_bound
implicit none
integer :: i,n
n = 3
do i=1,n
   n = n - 1 
   ! n has changed, but # of iterations is fixed at 3
   print*,"i,n=",i,n
end do
print*,"i,n=",i,n
print*
! The above is confusing and could be written as follows:
i = 1
n = 3
do
   n = n - 1
   print*,"i,n=",i,n
   i = i + 1
   if (i > 3) exit
end do
print*,"i,n=",i,n
end program loop_bound
! output:
!  i,n=           1           2
!  i,n=           2           1
!  i,n=           3           0
!  i,n=           4           0
! 
!  i,n=           1           2
!  i,n=           2           1
!  i,n=           3           0
!  i,n=           4           0
