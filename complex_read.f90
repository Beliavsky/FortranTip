implicit none ! GitHub FortranTip complex_read.f90
character (len=20) :: s
complex :: z
s = "(1.0, 4.5)"
read (s,*) z ! read entire complex variable
print*,z ! (1.0,4.5)
s = "1.0, 4.5"        ! not parenthesized
read (s,*) z%re, z%im ! read real and imag. parts separately
print*,z ! (1.0,4.5)
end
