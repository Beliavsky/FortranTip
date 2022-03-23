module m
implicit none
contains
function pos_first_positive_each_row(x) result(ipos)
! return vector with position of first positive 
! element in each row
real, intent(in) :: x(:,:)
integer          :: ipos(size(x,1))
integer          :: i,j
ipos = 0
iloop: do i=1,size(x,1)
   do j=1,size(x,2)
      if (x(i,j) > 0.0) then
         ipos(i) = j
         cycle iloop
      end if
   end do
end do iloop
end function pos_first_positive_each_row 
end module m
!
program test_cycle
use m
integer, parameter :: n1 = 5, n2 = 3
real :: x(n1,n2)
integer :: i,ipos_positive(n1),j
call random_number(x)
x = x - 0.5
ipos_positive = pos_first_positive_each_row(x)
print "(*(a8))","i","x(i,:)"
do i=1,n1
   print "(i8,*(f8.2))",ipos_positive(i),x(i,:)
end do
! print square root of first positive element in each row
print "(/,2a3,*(a14))","i","j","x(i,j)","sqrt(x(i,j))"
do i=1,n1
   j = ipos_positive(i)
   if (j == 0) cycle ! avoid computing sqrt of negative #
   print "(2i3,*(f14.2))",i,j,x(i,j),sqrt(x(i,j))
end do
end program test_cycle
! sample output:
!        i  x(i,:)
!        2   -0.23    0.28   -0.48
!        2   -0.37    0.27   -0.09
!        0   -0.02   -0.06   -0.43
!        1    0.07   -0.20   -0.25
!        0   -0.17   -0.16   -0.13
! 
!   i  j        x(i,j)  sqrt(x(i,j))
!   1  2          0.28          0.53
!   2  2          0.27          0.52
!   4  1          0.07          0.27
