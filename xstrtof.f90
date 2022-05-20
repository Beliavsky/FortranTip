program main ! GitHub FortranTip xstrtof.f90
use iso_c_binding, only: c_ptr, c_null_char
implicit none
!
interface
function c_strtof(string, p) bind(c,name="strtof")
! wrapper for C strtof(), which reads float from string
! and whose 2nd argument is char* or NULL
use iso_c_binding, only: c_char, c_float, c_ptr
character(kind=c_char) :: string(*)
type(c_ptr), optional  :: p
real(kind=c_float)     :: c_strtof
end function c_strtof
end interface
!
type(c_ptr) :: p
print "(f0.6)",c_strtof("3.14 pi" // c_null_char, p)
! omit the optional argument
print "(f0.6)",c_strtof("3.14 pi" // c_null_char)
end program main
! output:
! 3.140000
! 3.140000