module intent_out_alloc_mod
implicit none
type :: vec
   real, allocatable :: x(:)
end type vec
contains
!
subroutine sub(x)
real, intent(out), allocatable :: x(:)
end subroutine sub 
!
subroutine vec_sub(dt)
type (vec), intent(out) :: dt
end subroutine vec_sub
end module intent_out_alloc_mod

program test_intent_out_alloc
use intent_out_alloc_mod
implicit none
real, allocatable :: x(:)
type(vec) :: v
allocate (x(3),v%x(3))
print*,allocated(x),allocated(v%x) ! T T
call sub(x)
call vec_sub(v)
print*,allocated(x),allocated(v%x) ! F F
end program test_intent_out_alloc