module random_logical_mod
implicit none
contains
pure elemental function optval(x,default) result(y)
! modeled after Fortran stdlib optval
real, intent(in), optional :: x
real, intent(in)           :: default
real                       :: y
if (present(x)) then
   y = x
else
   y = default
end if
end function optval
!
subroutine random_logical_scalar(tf,prob)
! return logical variable that has probability prob
! of being .true., 0.5 if prob not PRESENT
logical, intent(out)          :: tf
real   , intent(in), optional :: prob
real                          :: x
call random_number(x)
tf = x < optval(prob,0.5)
end subroutine random_logical_scalar
!
subroutine random_logical_vec(tf,prob)
logical, intent(out)          :: tf(:)
real   , intent(in), optional :: prob
integer                       :: i
do i=1,size(tf)
! line below is valid since 2nd argument of callee is OPTIONAL
   call random_logical_scalar(tf(i),prob)
end do
end subroutine random_logical_vec
end module random_logical_mod
!
program test_random_logical
use random_logical_mod, only: random_logical_vec
implicit none
integer, parameter :: n = 1000
logical :: tf(n)
call random_logical_vec(tf)
print*,"fraction true =",count(tf)/real(n)
call random_logical_vec(tf,prob=0.9)
print*,"fraction true =",count(tf)/real(n)
end program test_random_logical
! sample output:
! fraction true =  0.500000000    
! fraction true =  0.903999984