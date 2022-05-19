module func_pointer_mod ! GitHub FortranTip c_func_ptr.f90
use iso_c_binding, only: c_int, c_funptr
implicit none
interface
!
function cfunc_2i(i, j, func_ptr) bind(c)
! call the function pointed to by func_ptr with
! arguments x and y
import c_int, c_funptr
integer(c_int)                       :: cfunc_2i
integer(c_int) , value, intent(in)   :: i, j
type(c_funptr), value, intent(in)    :: func_ptr
end function cfunc_2i
!
end interface
contains
!
function sum_int(i,j) result(res) bind(c)
integer(c_int), intent(in), value :: i, j
integer(c_int)                    :: res
res = i + j
end function sum_int
!
function diff_int(i,j) result(res) bind(c)
integer(c_int), intent(in), value :: i, j
integer(c_int)                    :: res
res = i - j
end function diff_int
!
end module func_pointer_mod

program test_func_pointer
use iso_c_binding   , only: c_int, c_funloc
use func_pointer_mod, only: sum_int, diff_int, cfunc_2i
implicit none
print*,cfunc_2i(3_c_int, 2_c_int, c_funloc(sum_int))   ! 5
print*,cfunc_2i(3_c_int, 2_c_int, c_funloc(diff_int))  ! 1
end program test_func_pointer
