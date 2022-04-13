module pdt_mod ! GitHub FortranTip pdt_matrix.f90
integer, parameter :: nlen = 20, sp = kind(1.0)
!
type, public :: data_frame(n1,n2,wp)
! n1 by n2 matrix of reals of kind wp with row and column names
integer, len         :: n1=100,n2=100  ! dimensions of x(:,:)
! below, wp is set to single precision kind by default
integer, kind        :: wp = kind(1.0) ! kind of x(:,:)
real(kind=wp)        :: x(n1,n2)
character (len=nlen) :: row_names(n1),col_names(n2)
end type data_frame
!
contains
subroutine display(df)
! dimensions of data_frame can be assumed, but not kind
type(data_frame(*,*,sp)), intent(in) :: df
integer                              :: i
print "(6x,*(a8))","",df%col_names
do i=1,df%n1
   print "(a8,*(f8.4))",df%row_names(i),df%x(i,:)
end do
end subroutine display

end module pdt_mod
!
program test_data_frame
use pdt_mod, only: data_frame, display
implicit none
integer, parameter :: dp = kind(1.0d0), sp = kind(1.0), &
                      n1 = 2, n2 = 3
type(data_frame(n1,n2,dp))            :: df ! df%n1, df%n2 fixed
type(data_frame)                      :: ds
! ds takes the default values of n1, n2, wp since they are unspecified
type(data_frame(:,:,sp)), allocatable :: da ! da%n1, da%n2 set later
character (len=20)                    :: fmt_ci = "(a,*(1x,i0))"
print fmt_ci, &
 "shape(df%x), size(df%row_names), size(df%col_names) =", &
  shape(df%x), size(df%row_names), size(df%col_names)
! KIND and LEN parameters can be accessed as follows:
print fmt_ci,"df%n1, df%n2, df%wp=",df%n1,df%n2,df%wp
print fmt_ci,"ds%n1, ds%n2, ds%wp=",ds%n1,ds%n2,ds%wp
allocate (data_frame(n1,n2,sp) :: da)
print fmt_ci,"shape(da%x), kind(da%x) =",shape(da%x),kind(da%x)
call random_number(da%x)
da%row_names=["r1","r2"] ; da%col_names = ["c1","c2","c3"]
call display(da)
end program test_data_frame
! gfortran 12.0.1 cannot compile the display() subroutine
! Intel Fortran sample output:
! shape(df%x), size(df%row_names), size(df%col_names) = 2 3 2 3
! df%n1, df%n2, df%wp= 2 3 8
! ds%n1, ds%n2, ds%wp= 100 100 4
! shape(da%x), kind(da%x) = 2 3 4
!               c1      c2      c3      
! r1        0.0000  0.3525  0.9631
! r2        0.0255  0.6669  0.8383
