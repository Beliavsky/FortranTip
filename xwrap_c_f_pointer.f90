module squares_mod
use iso_c_binding, only : c_ptr, c_f_pointer, c_int
implicit none
interface
!
function squares_p(nsq_max, sq_max, nsq) bind(c)
import c_ptr, c_int
integer(kind=c_int), value, intent(in)  :: nsq_max ! max # of squares to return
integer(kind=c_int), value, intent(in)  :: sq_max  ! max value of squares to return
integer(kind=c_int)       , intent(out) :: nsq     ! # of squares returned
type(c_ptr)                             :: squares_p ! pointer to squares returned
end function squares_p
!
subroutine c_free(ptr) bind(c,name="free")
import c_ptr
type(c_ptr), value :: ptr
end subroutine c_free
!
end interface
contains
function squares(nsq_max, sq_max) result(sq_vec)
! return up to nsq_max squares with values up to sq_max
integer(kind=c_int), value, intent(in)  :: nsq_max ! max # of squares to return
integer(kind=c_int), value, intent(in)  :: sq_max  ! max value of squares to return
integer(kind=c_int), allocatable        :: sq_vec(:)
integer(kind=c_int)                     :: nsq
type(c_ptr)                             :: c_p
integer(c_int)     , pointer            :: f_ip(:) => null()
c_p = squares_p(nsq_max,sq_max,nsq)
call c_f_pointer(c_p,f_ip,[nsq]) ! copy c_p to f_ip
sq_vec = f_ip
call c_free(c_p) ! free memory associated with c_p to avoid memory leak
end function squares
end module squares_mod
!
program main
use squares_mod, only: c_int, squares
implicit none
integer(kind=c_int) :: sq_max
integer(kind=c_int), parameter :: nsq_max = 10
integer, allocatable :: sq_vec(:)
print "(*(a6))","sq_max","#sq","f_ip"
do sq_max=0,5
   sq_vec = squares(nsq_max, sq_max)
   print "(*(i6))", sq_max, size(sq_vec), sq_vec
end do
deallocate (sq_vec)
end program main
! Compile with
! g++ -o squares.o -c squares.cpp
! gfortran squares.o xwrap_c_f_pointer.f90 -lstdc++