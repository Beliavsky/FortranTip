module reverse_mod
implicit none
contains
elemental function reverse(s) result(t)
! return reversed string
character (len=*), intent(in) :: s
character (len=len(s))        :: t
integer                       :: i,j,nlen
nlen = len(s)
do i=1,nlen
   j = nlen-i+1
   t(i:i) = s(j:j)
end do
end function reverse
end module reverse_mod
!
program test_reverse
use reverse_mod, only: reverse
implicit none
integer, parameter :: n = 3
integer :: v(n) = [10,20,30]
character (len=:), allocatable :: s, t
print*,size(v(n:1)),size(v(::-1)) ! 0 0
! v(::-1) = v(1:n:-1) is a zero-size array
v = v(n:1:-1)
print*,v ! 30 20 10
s = "tin"
s = reverse(s)
print*,s ! nit
end program test_reverse
