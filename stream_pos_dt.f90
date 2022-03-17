module derived_type_mod
integer, parameter :: wp = kind(1.0)
type :: rec
   integer :: i
   real(kind=wp) :: r(2)
end type rec
end module derived_type_mod
!
program stream_pos
use iso_fortran_env , only: file_storage_size
use derived_type_mod, only: wp, rec
implicit none
integer, parameter :: iu = 10, n = 10**7
type(rec)          :: x(n),x1,x2,xn
integer            :: i,pos_x, pos_n,size_x
character (len=*), parameter :: data_file = "temp.bin", &
   fmt_g = "(*(g0.3,:,1x))"
size_x=storage_size(x)
! size of an element of x(:) in bits
pos_x = size_x/file_storage_size 
! increment of position to get next element
call random_number(x%r(1))
call random_number(x%r(2))
forall (i=1:n) x(i)%i = 10*i
open (unit=iu,file=data_file,action="readwrite", &
      access="stream",form="unformatted")
print fmt_g,"storage_size_i =",storage_size(x%i)
print fmt_g,"storage_size_ir =",storage_size(x(1)%r)
print fmt_g,"storage_size_type =",size_x
print fmt_g,"file_storage_size =",file_storage_size
print fmt_g,"position increment =",pos_x
write (iu) x
read (iu,pos=1) x1 ! read first element
print fmt_g,"1st",x(1),x1
! read 2nd element at position offset pos_x from 1st
read (iu,pos=1+pos_x) x2 
print fmt_g,"2nd",x(2),x2
! read nth element
pos_n = 1 + (n-1)*pos_x
read (iu,pos=pos_n) xn
print fmt_g,"nth",x(n),xn
! multiply the nth value in file by 10
x(n)%r = 10*x(n)%r
write (iu,pos=pos_n) x(n)
read (iu,pos=pos_n) xn ! read new nth value
print fmt_g,"10*nth",xn
end program stream_pos
! sample gfortran output:
! storage_size_i = 32
! storage_size_ir = 32
! storage_size_type = 96
! file_storage_size = 8
! position increment = 12
! 1st 10 0.779 0.367 10 0.779 0.367
! 2nd 20 0.220 0.590 20 0.220 0.590
! nth 100000000 0.122 0.671 100000000 0.122 0.671
! 10*nth 100000000 1.22 6.71
