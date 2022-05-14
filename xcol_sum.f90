module matrix_mod
use iso_c_binding, only: c_int, c_float
implicit none
interface
pure subroutine sum_cols(nrow_c,ncol_c,x,col_sums) bind(c,name="sum_rows")
! C function to compute row sums computes column sums of Fortran matrix
import c_int, c_float
integer(kind=c_int), intent(in), value :: nrow_c, ncol_c
real(kind=c_float) , intent(in)        :: x(ncol_c,nrow_c)
real(kind=c_float) , intent(out)       :: col_sums(nrow_c)
end subroutine sum_cols
end interface
!
contains
pure function column_sums(x) result(col_sums) ! wrap sum_cols
real(kind=c_float), intent(in) :: x(:,:)
real(kind=c_float) :: col_sums(size(x,2))
call sum_cols(size(x,2),size(x,1),x,col_sums)
end function column_sums
end module matrix_mod

program xcol_sum
use matrix_mod, only: c_float, sum_cols, column_sums
implicit none
integer, parameter :: nr = 2, nc = 3
real(kind=c_float) :: x(nr,nc),col_sums(nc)
integer            :: ir,ic
character (len=20) :: fmt="(a,*(1x,f5.1))"
print*,"matrix"
do ir=1,nr
   forall (ic=1:nc) x(ir,ic) = real(10*ir + ic, kind = c_float)
   print "(*(1x,f5.1))",x(ir,:)
end do
! call subroutine with explicit-shape array arguments
call sum_cols(nrow_c=nc, ncol_c=nr, x=x, col_sums=col_sums)
print fmt,"col_sums=",col_sums
! call function with assumed-shape argument -- simpler
print fmt,"col_sums=",column_sums(x)
end program xcol_sum
! Compile with
!   gcc -c -o sum_rows.o sum_rows.c
!   gfortran sum_rows.o xcol_sum.f90
! output:
!  matrix
!   11.0  12.0  13.0
!   21.0  22.0  23.0
! col_sums=  32.0  34.0  36.0
! col_sums=  32.0  34.0  36.0
