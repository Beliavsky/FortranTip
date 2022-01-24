module intent_out_mod
implicit none
contains
subroutine sub(i)
integer, intent(out) :: i
print*,"in sub, i=",i ! undefined
end subroutine sub
end module intent_out_mod
!
program test_intent_out
use intent_out_mod
implicit none
integer :: i
i = 3
call sub(i) 
end program test_intent_out
! output with gfortran, ifort, and g95,
! but not mandated by standard:
! in sub, i=           3
! ifort does warn that 'i' is not set