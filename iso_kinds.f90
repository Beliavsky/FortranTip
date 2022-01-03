program iso_kinds
use iso_fortran_env, only: real32,real64,real128,int8,int16,int32, &
                           int64,integer_kinds,real_kinds
implicit none
real(real32)   :: x32
real(real64)   :: x64
real(real128)  :: x128
integer(int8)  :: i8
integer(int16) :: i16
integer(int32) :: i32
integer(int64) :: i64
! negative values for real32, real64, real128 mean they are unsupported
print "('real32, real64, real128:',*(1x,i0))",real32,real64,real128
! real_kinds and integer_kinds are a Fortran 2008 feature.
print "('real_kinds:',*(1x,i0))",real_kinds ! available real kinds
print "(/,'int8, int16, int32, int64:',*(1x,i0))",int8,int16,int32,int64
print "('integer_kinds:',*(1x,i0))",integer_kinds ! available integer kinds
print "(/,'huge() for integer types')"
print "(' int8',1x,i0)",huge(i8)
print "('int16',1x,i0)",huge(i16)
print "('int32',1x,i0)",huge(i32)
print "('int64',1x,i0)",huge(i64)
print "(/,'huge() for real types')"
print*," real32",huge(x32)
print*," real64",huge(x64)
print*,"real128",huge(x128)
print "(/,'tiny() for real types')"
print*," real32",tiny(x32)
print*," real64",tiny(x64)
print*,"real128",tiny(x128) 
end program iso_kinds
! output for gfortran. 
! real32, real64, real128: 4 8 16
! real_kinds: 4 8 10 16
! 
! int8, int16, int32, int64: 1 2 4 8
! integer_kinds: 1 2 4 8 16
!
! results up to here may differ by compiler
! 
! huge() for integer types
!  int8 127
! int16 32767
! int32 2147483647
! int64 9223372036854775807
! 
! huge() for real types
!   real32   3.40282347E+38
!   real64   1.7976931348623157E+308
!  real128   1.18973149535723176508575932662800702E+4932
! 
! tiny() for real types
!   real32   1.17549435E-38
!   real64   2.2250738585072014E-308
!  real128   3.36210314311209350626267781732175260E-4932
