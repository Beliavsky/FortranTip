module check_kind_mod
use iso_fortran_env, only: real32, real64
implicit none
contains
subroutine sub(x)
class(*), intent(in) :: x
select type (x)
   type is (real(real32))
      print*,"type is real32"
   type is (real(real64))
      print*,"type is real64"
end select
end subroutine sub
end module check_kind_mod
!
program main
use check_kind_mod
implicit none
call sub(1.0)
call sub(1.0d0)
end program main
! output:
!  type is real32
!  type is real64