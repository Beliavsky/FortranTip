! GitHub FortranTip namelist_arg.f90
! based on https://fortranwiki.org/fortran/show/get_namelist
use iso_fortran_env, only: output_unit
implicit none
integer :: year, month, day
character (len=100) :: string, nml_text
namelist /date/ year, month, day
! set default values for namelist members
year = 2000 ; month = 1 ; day = 1
call get_command(string)
string = adjustl(string) // " " ! assuming command verb does not have spaces in it
string = string(index(string," "):)
nml_text = "&date " // trim(string) // "/" ! add namelist prefix and terminator
read (nml_text,nml=date)
print "('year, month, day:',3(1x,i0))", year, month, day
end
! Ouput of 'a.exe year=2024 day=30'
! year, month, day: 2024 1 30
