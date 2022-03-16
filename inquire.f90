module inquire_mod
implicit none
contains
function file_exists(file) result(exists)
character (len=*), intent(in) :: file
logical                       :: exists
inquire (file=file,exist=exists)
end function file_exists
!
function file_of_unit(iu) result(file_name)
! return name of file connected to unit iu, "" if unopened
integer, intent(in)  :: iu
character (len=1000) :: file_name
logical              :: opened
inquire(unit=iu,opened=opened)
if (opened) then
   inquire (unit=iu,name=file_name)
else
   file_name = ""
end if
end function file_of_unit

end module inquire_mod
!
program test_inquire
use inquire_mod, only: file_exists, file_of_unit
implicit none
integer, parameter :: iu = 20, ju = 21
character (len=20) :: action, form, access, position
character (len=*), parameter :: file_name = "temp.txt", &
                                bad_name = "defgh.txt"
integer :: fsize
print*,file_name // ", " // bad_name // " exist?", &
       file_exists(file_name),file_exists(bad_name)
open (unit=iu,file="temp.txt",action="read",status="old")
print*,"file connected to iu: '"//trim(file_of_unit(iu))//"'"
print*,"file connected to ju: '"//trim(file_of_unit(ju))//"'"
inquire (file=file_name,action=action,form=form,size=fsize, &
         access=access,position=position)
print*,new_line(" "),"properties of " // trim(file_name)
print*,"action = " // trim(action) ! READ, WRITE, READWRITE
print*,"form = " // trim(form)     ! FORMATTED, UNFORMATTED
print*,"access = " // trim(access) ! SEQUENTIAL, DIRECT, STREAM
print*,"position = " // trim(position) ! ASIS, REWIND, APPEND
print*,"size =",fsize              ! usually in bytes
end program test_inquire
! output for temp.txt containing "abc" and defgh.txt absent:
!  temp.txt, defgh.txt exist? T F
!  file connected to iu: 'temp.txt' ! ifort includes directory
!  file connected to ju: ''
!  
! properties of temp.txt
!  action = READ
!  form = FORMATTED (not specified in OPEN but is default)
!  access = SEQUENTIAL (default)
!  position = ASIS (default)
!  size =           3
