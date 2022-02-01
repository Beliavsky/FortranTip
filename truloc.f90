module truloc_mod
implicit none
public :: truloc
contains
function truloc(tf) result(ipos)
! return the locations of the true positions in tf(:)
logical, intent(in) :: tf(:)
integer             :: ipos(count(tf))
integer             :: i,j,ntrue
ntrue = size(ipos)
j = 1
if (ntrue == 0) return
do i=1,size(tf)
   if (tf(i)) then
      ipos(j) = i
      if (j == ntrue) return
      j = j + 1
   end if
end do
end function truloc
end module truloc_mod

program test_truloc
use truloc_mod, only: truloc
implicit none
integer :: v(3)
v = [-2,3,-4]
print*,merge(-1,v,v<0) ! -1 3 -1
v(truloc(v<0)) = -1
print*,v ! -1 3 -1
where (v < 0) v = -2
print*,v ! -2 3 -2
end program test_truloc
