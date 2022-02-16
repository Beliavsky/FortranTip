program test_storage_size 
! test the storage_size function of Fortran 2008
use iso_fortran_env, only: int64
implicit none
intrinsic :: storage_size
type :: date_ymd
   integer :: year, month, day
end type date_ymd
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
write (*,"(a30,a15)") "entity","storage_size"
write (*,"(a30,i15)") "integer",storage_size(i), &
      "int64",storage_size(i64),"real",storage_size(x), &
      "real(kind=dp)",storage_size(x_dp), &
      "real(kind=dp), dimension(3)",storage_size(xvec_dp), &
      "complex",storage_size(z), &
      "logical",storage_size(tf), &
      "character(len=1)",storage_size(s), & 
      "character(len=10)",storage_size(string), &
      "date_ymd",storage_size(date)
end program test_storage_size
! Output:
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
