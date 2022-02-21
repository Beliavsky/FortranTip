program test_storage_size 
! test the storage_size function of Fortran 2008
use iso_fortran_env, only: int64
implicit none
intrinsic :: storage_size
type :: date_ymd
   integer :: year, month, day
end type date_ymd
type :: int_real
   integer, allocatable :: i(:)
   real   , allocatable :: x(:)
end type int_real
type :: int_real_1000
   integer :: i(1000)
   integer :: x(1000)
end type int_real_1000
integer, parameter          :: dp = kind(1.0d0)
logical                     :: tf
character(len=1)            :: s
character(len=10)           :: string
integer                     :: i
integer(kind=int64)         :: i64
real                        :: x
real(kind=dp)               :: x_dp
real(kind=dp), dimension(3) :: xvec_dp
complex                     :: z
type(date_ymd)              :: date
type(int_real)              :: ir,ir_unalloc
type(int_real_1000)         :: ir1000
allocate (ir%i(1000),ir%x(1000))
write (*,"(a30,a15)") "entity","storage_size"
write (*,"(a30,i15)") "integer",storage_size(i), &
      "int64",storage_size(i64),"real",storage_size(x), &
      "real(kind=dp)",storage_size(x_dp), &
      "real(kind=dp), dimension(3)",storage_size(xvec_dp), &
      "complex",storage_size(z), &
      "logical",storage_size(tf), &
      "character(len=1)",storage_size(s), & 
      "character(len=10)",storage_size(string), &
      "date_ymd",storage_size(date), &
      "int_real_1000",storage_size(ir1000), &
      "int_real_unalloc",storage_size(ir_unalloc), &
      "int_real_alloc_1000",storage_size(ir), &
      "int_real_alloc_1000*",storage_size_int_real(ir)
contains
!
elemental function storage_size_int_real(ir) result(siz)
! custom definition of storage size for type(int_real)
type(int_real), intent(in) :: ir
integer                    :: siz
siz = 0
if (allocated(ir%i)) siz = siz + size(ir%i)*storage_size(ir%i)
if (allocated(ir%x)) siz = siz + size(ir%x)*storage_size(ir%x)
end function storage_size_int_real
!
end program test_storage_size
! gfortran output (ifort and flang differ only for 
! int_real_unalloc and int_real_alloc_1000):
!                         entity   storage_size
!                        integer             32
!                          int64             64
!                           real             32
!                  real(kind=dp)             64
!    real(kind=dp), dimension(3)             64
!                        complex             64
!                        logical             32
!               character(len=1)              8
!              character(len=10)             80
!                       date_ymd             96
!                  int_real_1000          64000
!               int_real_unalloc           1024
!            int_real_alloc_1000           1024
!           int_real_alloc_1000*          64000
