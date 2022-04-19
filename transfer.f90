program test_transfer
use iso_fortran_env, only: int64, real64
implicit none
type :: point
   real :: a,b
end type point
real :: x(2)
complex :: z
type(point) :: p
integer(kind=int64) :: i
real(kind=real64)   :: d
character(8) :: s
z = (3.0,4.0)
x = transfer(z,x) ! copy complex to 2 reals
print*,x ! 3.0 4.0
p = transfer(x,p) ! copy 2 reals to type(point)
print*,p ! 3.0 4.0
x = transfer(p,x) ! copy type(point) to 2 reals
print*,x ! 3.0 4.0
i = huge(i)
! converting from int64 to real64 and back using
! nint and real does not work for huge(1_int64)
print*,i,nint(real(i,kind=real64),kind=real64)
! transferring from int64 to real64 and back works
print*,i,transfer(transfer(i,d),i)
! transfer character (len=8) to real64 and back
s = "aeio+-*/"
print*,s // " " // transfer(transfer(s,d),s)
end program test_transfer
! output:
!    3.00000000       4.00000000    
!    3.00000000       4.00000000    
!    3.00000000       4.00000000    
!   9223372036854775807 -9223372036854775808
!   9223372036854775807  9223372036854775807
!  aeio+-*/ aeio+-*/