implicit none
integer, parameter :: n=3
integer :: i
character (len=2) :: s(n)
! use an implied do loop to set s(:)
write (s,"('x',i0)") (i, i=1,n) 
print "(*(1x,a))",s ! x1 x2 x3
! use a regular do loop to set s(:)
do i=1,n 
   write (s(i), "('x',i0)") i
end do
print "(*(1x,a))",s ! x1 x2 x3
end
