! GitHub FortranTip utf.f90
! by Vincent Magnin at Fortran Discourse
! contents of utf_in.txt are the next 2 lines
! Lire des caractères accentués n'est pas difficile.
! éèçàâäùëêïîüûöô
use iso_fortran_env, only: output_unit
implicit none
integer, parameter :: ucs4 = selected_char_kind("iso_10646")
character(len=100, kind=ucs4) :: string
open(10, file="utf_in.txt",  encoding="utf-8")
open(11, file="utf_out.txt", encoding="utf-8")
open(output_unit, encoding="utf-8")
! First line:
read( 10, "(a)") string
write(11, "(a)") string
write(output_unit, "(a)") string
! Second line:
read( 10, "(a)") string
write(11, "(a)") string
write(output_unit, "(a)") string
close(10)
close(11)
end