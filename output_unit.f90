program main
use iso_fortran_env, only: input_unit,output_unit
implicit none
integer :: n
print*,"enter an integer"
read (input_unit,*) n ! equivalent to next line
! read (*,*) n 
print "(i0,'^2 = ',i0)",n,n**2 ! prints to screen
open (unit=output_unit,file="temp.txt",action="write")
! causes each line below to write to temp.txt
print "(i0,'^3 = ',i0)", n,n**3
write (*,"(i0,'^4 = ',i0)") n,n**4
write (output_unit,"(i0,'^5 = ',i0)") n,n**5
end program main
! sample run, compiling with gfortran, flang, g95, 
! or ifort -standard-semantics:
!  enter an integer
! 10
! 10^2 = 100
! contents of temp.txt:
! 10^3 = 1000
! 10^4 = 10000
! 10^5 = 100000