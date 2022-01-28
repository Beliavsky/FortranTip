! A reference is https://www.nag.com/nagware/np/r70_doc/ieee_arithmetic.html
program test_ieee_exceptions
use :: ieee_exceptions, only: ieee_set_halting_mode, ieee_invalid, &
       ieee_overflow, ieee_underflow, ieee_divide_by_zero, ieee_inexact
implicit none
real :: a, b, c, d, e, f, g
logical, parameter :: halt_program = .true.
call ieee_set_halting_mode([ieee_divide_by_zero, ieee_underflow, &
     ieee_overflow, ieee_invalid],halting=halt_program)
! causes halt if divide_by_zero, underflow, overflow, or NaN conditions occur
! remove element from array constructor to have program continue with that condition
f = 1.0
print*,"computing 1.0/0.0"
print*,f/0.0
e = tiny(e)
print*,"tiny =",e,", computing tiny/10"
print*,e/10
d = huge(d)
print*,"huge =",d,", computing huge**2"
print*,d**2
a = 0.0
b = 0.0
print*,"a, b=",a,b
print*,"computing c = a/b"
c = a/b
print*,"c=",c
! since floating point roundoff is ubiquitous, probably
! do not want the following mode
call ieee_set_halting_mode(ieee_inexact, halting=halt_program)
print*,"computing 2.0/3.0"
g = 2.0/3.0
print*,"2.0/3.0 =",g
end program test_ieee_exceptions
! output on Windows with ifort -traceback ieee_exceptions.f90
!  computing 1.0/0.0
! forrtl: error (73): floating divide by zero
! Image              PC                Routine            Line        Source             
! ieee_exceptions.e  00007FF6EBBF112A  MAIN__                     14  ieee_exceptions.f90
