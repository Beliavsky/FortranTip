module matrix_mod
use iso_c_binding, only: c_int, c_float
implicit none
interface
subroutine print_mat(nrow_c, ncol_c, x) bind(c,name="print_mat_transpose")
import c_int, c_float
integer(kind=c_int), intent(in), value :: nrow_c, ncol_c
real(kind=c_float) , intent(in)        :: x(ncol_c,nrow_c)
end subroutine print_mat
!
function sum_mat(nrow_c,ncol_c,x) result(xsum) bind(c)
import c_int, c_float
integer(kind=c_int), intent(in), value :: nrow_c, ncol_c
real(kind=c_float) , intent(in)        :: x(ncol_c,nrow_c)
end function sum_mat
!
subroutine sum_cols(nrow_c,ncol_c,x,col_sums) bind(c,name="sum_rows")
import c_int, c_float
integer(kind=c_int), intent(in), value :: nrow_c, ncol_c
real(kind=c_float) , intent(in)        :: x(ncol_c,nrow_c)
real(kind=c_float) , intent(out)       :: col_sums(nrow_c)
end subroutine sum_cols
!
subroutine scale_mat(xscale, nrow_c, ncol_c, x) bind(c,name="scale_mat")
import c_int, c_float
real(kind=c_float) , intent(in), value :: xscale
integer(kind=c_int), intent(in), value :: nrow_c, ncol_c
real(kind=c_float) , intent(in)        :: x(ncol_c,nrow_c)
end subroutine scale_mat
!
end interface
!
contains
function column_sums(x) result(col_sums)
real(kind=c_float), intent(in) :: x(:,:)
real(kind=c_float) :: col_sums(size(x,2))
call sum_cols(size(x,2),size(x,1),x,col_sums)
end function column_sums
end module matrix_mod

program xxmat
use matrix_mod, only: c_float, print_mat, sum_mat, sum_cols, scale_mat, &
                      column_sums
implicit none
integer, parameter :: nr = 2, nc = 3
real(kind=c_float) :: x(nr,nc),row_sums(nr),col_sums(nc)
integer            :: ir,ic
character (len=20) :: fmt="(a,*(1x,f0.1))"
print*,"matrix"
do ir=1,nr
   do ic=1,nc
      x(ir,ic) = real(10*ir + ic, kind = c_float)
   end do
   print "(*(1x,f5.1))",x(ir,:)
end do
print "(/,a)", "calling print_mat"
call print_mat(nrow_c=nc, ncol_c=nr, x=x)
print*
print fmt,"sum_mat(nr,nc,x), sum(x) =",sum_mat(nr,nc,x),sum(x)
call sum_cols(nrow_c=nc, ncol_c=nr, x=x, col_sums=col_sums)
print fmt,"col_sums =",col_sums
print fmt,"col_sums =",column_sums(x)
print fmt,"sum(x,dim=1) =",sum(x,dim=1)
call scale_mat(xscale=10.0, nrow_c=nc, ncol_c=nr, x=x)
print "(/,a)","matrix after scaling:"
call print_mat(nrow_c=nc, ncol_c=nr, x=x)
end program xxmat
! Compile with
!   gcc -c -o sum_mat.o sum_mat.c
!   gfortran sum_mat.o xxmat.f90
! output:
!  matrix
!   11.0  12.0  13.0
!   21.0  22.0  23.0
! 
! calling print_mat
!  11.000000 12.000000 13.000000
!  21.000000 22.000000 23.000000
! 
! sum_mat(nr,nc,x), sum(x) = 102.0 102.0
! col_sums = 32.0 34.0 36.0
! col_sums = 32.0 34.0 36.0
! sum(x,dim=1) = 32.0 34.0 36.0
! 
! matrix after scaling:
!  110.000000 120.000000 130.000000
!  210.000000 220.000000 230.000000