program x_c_f_pointer ! GitHub FortranTip c_f_pointer.f90
use iso_c_binding, only : c_ptr, c_f_pointer, c_int
implicit none
type(c_ptr) :: c_p
integer(c_int), pointer :: f_ip(:) => null()
integer :: nsq
interface
!
function squares_p(sq_max, nsq) bind(c)
import c_ptr, c_int
integer(kind=c_int), value, intent(in)  :: sq_max  ! max value of squares to return
integer(kind=c_int)       , intent(out) :: nsq     ! # of squares returned
type(c_ptr)                             :: squares_p ! pointer to squares returned
end function squares_p
!
subroutine c_free(ptr) bind(c,name="free") ! interface for free() of C stdlib
import c_ptr
type(c_ptr), value :: ptr
end subroutine c_free
!
end interface
integer :: sq_max
print "(*(a6))","sq_max","#sq","f_ip"
do sq_max=1,41,20
   c_p = squares_p(sq_max,nsq)
   call c_f_pointer(c_p,f_ip,[nsq]) ! copy c_p to f_ip
   print "(*(i6))",sq_max,nsq,f_ip
   nullify(f_ip) ! disassociate f_ip from c_p, which is about to be freed
   call c_free(c_p) ! free memory from C squares_p() to avoid memory leak
end do
end program x_c_f_pointer
! Compile with
!   gcc -o squares.o -c squares.c
!   gfortran squares.o c_f_pointer.f90
! output:
! sq_max   #sq  f_ip
!      1     1     1
!     21     4     1     4     9    16
!     41     6     1     4     9    16    25    36
