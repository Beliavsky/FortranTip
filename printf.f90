! warning: calling printf this way does not work for float or double arguments
! and is not standard-conforming -- see https://fortran-lang.discourse.group/t/gfortran-bindc-printf/3445
program call_printf ! GitHub FortranTip printf.f90
use iso_c_binding, only: c_int, c_char, c_null_char, c_new_line
interface
function print_string(fmt,s) result(ierr) bind(c,name="printf")
! Use C printf() to print string with format fmt
import c_char
character(c_char) :: fmt(*), s(*)
end function print_string
end interface
interface
function print_integer(fmt,i) result(ierr) bind(c,name="printf")
! Use C printf() to print integer with format fmt
import c_char, c_int
character(c_char) :: fmt(*)
integer(kind=c_int), intent(in), value :: i
end function print_integer
end interface
integer :: ierr
ierr = print_string("string is %s" // c_new_line // c_null_char, &
                    "abc" // c_null_char)
ierr = print_integer("int is %d" // c_new_line // c_null_char, 42_c_int)
end program call_printf
! output:
! string is abc
! int is 42
