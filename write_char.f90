program write_char
implicit none
character (len=3) :: s
character (len=*), parameter :: fmt = "(a)"
write (s,fmt) "abc"
write (*,fmt) s ! abc
s = "abcd" ! valid, although compiler may warn about truncation
write (*,fmt) s ! abc
write (s,fmt) "abcd" ! invalid -- s is too small
end program write_char
! gfortran output (Intel Fortran and g95 output is similar):
! abc
! abc
! At line 5 of file write_char.f90
! Fortran runtime error: End of record
