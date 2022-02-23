module unlimited_mod
implicit none
contains
subroutine twice(p)
class(*), intent(in out) :: p
select type (p)
   type is (integer)
      p = 2*p
   type is (real)
      p = 2*p
   type is (character (len=*))
      p = trim(p) // trim(p)
end select
end subroutine twice
end module unlimited_mod
!
program unlimited_pointer
use unlimited_mod, only: twice
implicit none
real, target :: x
integer, target :: i
character (len=100), target :: s
class(*), pointer :: p
character (len=20) :: fmt = "(a10,f5.2,i4,a10)"
x = 3.14
i = 42
s = "abc"
print fmt,"before",x,i,trim(s)
p => x
call twice(p)
p => i
call twice(p)
p => s
call twice(p)
print fmt,"after",x,i,trim(s)
end program unlimited_pointer
! output:
!     before 3.14  42       abc
!      after 6.28  84    abcabc