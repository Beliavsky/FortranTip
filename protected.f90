module access_mod
implicit none
private
public :: i, k, n, set_var
integer :: i, j
integer, protected :: k
integer, parameter :: n = 8
contains
subroutine set_var()
! module variables can be set in that module even if they are
! private or protected. 
i = 2
j = 3
k = 4
! n = 9 ! invalid: cannot change a named constant
end subroutine set_var
end module access_mod
!
program test_access
use access_mod
implicit none
character (len=*), parameter :: fmt = "(a,*(1x,i0))"
call set_var()
print fmt,"i, k =",i,k
i = 5 ! can change i since it is not protected
print fmt,"i =",i
! k = 6 ! gfortran says "Error: Variable 'k' is PROTECTED"
! j = 7 ! gfortran says "Error: Symbol 'j' at (1) has no IMPLICIT type"
end program test_access
