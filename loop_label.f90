program loop_label
implicit none
integer, parameter :: n = 5
real               :: x(n,n)
integer            :: i,j,ineg,jneg
call random_number(x)
x = x - 0.1
ineg = 0
jneg = 0
! find location of first negative element in x,
! traversing by row
iloop: do i=1,n
   do j=1,n
      if (x(i,j) < 0.0) then
         ineg = i
         jneg = j
         exit iloop
      end if
   end do
end do iloop
print "(a,2i3)","first negative value at ",ineg,jneg
print*,"x ="
do i=1,n
   print "(*(1x,f5.2))", x(i,:)
end do
end program loop_label
! sample output:
! first negative value at   3  4
!  x =
!   0.85  0.64  0.82  0.13  0.65
!   0.17  0.14  0.23  0.83  0.59
!   0.41  0.27  0.89 -0.06  0.06
!   0.58  0.63  0.10  0.17  0.87
!   0.32  0.74  0.70  0.75  0.28