module m
implicit none
contains
function lower_case(string) result(new)
! adapted from code by Arjen Markus at
! https://groups.google.com/g/comp.lang.fortran/c/CKx1L2Ahkxg
character(len=*), intent(in) :: string
character(len=len(string))   :: new
integer                      :: i,k
integer, parameter           :: diff = iachar("a") - iachar("A")
new = string
do i=1,len(string)
   k = iachar(string(i:i))
   if (k >= iachar("A") .and. k <= iachar("Z")) then
      k = k + diff
      new(i:i) = achar(k) ! set the i'th character of new
   end if
end do
end function lower_case
end module m
!
program xchange_case
use m, only: lower_case
implicit none
print*,lower_case("Bob R. Jones") ! bob r. jones
print*,"Bob" == "bob" ! F
print*,lower_case("Bob") == lower_case("bob") ! T
end program xchange_case
