program pointer_remap_array
implicit none
integer, parameter :: n = 6
integer, target    :: a1d(n)
integer, pointer   :: a2d(:,:)
integer            :: i,i1,iter
a1d = [(10*i,i=1,n)]
print "('a1d =',/,*(i4))",a1d
do iter=1,2
   print*
   if (iter == 1) then 
! map a1d to array with lower bounds 1, 1
      a2d(1:3,1:2) => a1d
      print*,"a2d(1:3,1:2) => a1d"
   else
! map a1d to array with lower bounds -1, 1
      a2d(-1:1,1:2) => a1d 
      print*,"a2d(-1:1,1:2) => a1d"
   end if
   print "(' shape(a2d) =',*(1x,i4))",shape(a2d)
   print "('lbound(a2d) =',*(1x,i4))",lbound(a2d)
   print "('ubound(a2d) =',*(1x,i4))",ubound(a2d)
   print "(/,'a2d =')"
   do i1=lbound(a2d,1),ubound(a2d,1)
      print "(*(i4))",a2d(i1,:)
   end do
   ! changes to pointer affect the pointee
   if (iter == 2) a2d(-1,1) = a2d(-1,1)*10
end do
print "(/,'a1d =',/,*(i4))",a1d
end program pointer_remap_array
! output:
! a1d =
!   10  20  30  40  50  60
!  
!  a2d(1:3,1:2) => a1d
!  shape(a2d) =    3    2
! lbound(a2d) =    1    1
! ubound(a2d) =    3    2
! 
! a2d =
!   10  40
!   20  50
!   30  60
!  
!  a2d(-1:1,1:2) => a1d
!  shape(a2d) =    3    2
! lbound(a2d) =   -1    1
! ubound(a2d) =    1    2
! 
! a2d =
!   10  40
!   20  50
!   30  60
! 
! a1d =
!  100  20  30  40  50  60