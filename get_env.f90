program get_env ! demonstrate get_environment_variable
implicit none
print*,"unix?",unix()
call print_env_var([character(20) :: "os","username","computername", &
     "HOSTTYPE","LOGNAME","HOME"])
contains
!
impure elemental subroutine print_env_var(variable)
character (len=*), intent(in) :: variable
character (len=1000) :: value
call get_environment_variable(variable,value)
! if the environment variable does not exist or is blank, skip printing
if (value /= "") write (*,"(a)") trim(variable) // ": " // trim(value)
end subroutine print_env_var
!
function unix() result(is_unix)
! test if the operating system is Unix -- useful for setting a 
! directory separator of / or \
logical :: is_unix
character (len=100) :: path
call get_environment_variable("PATH",path)
is_unix = path(1:1) == "/"
end function unix
!
end program get_env
! Windows output:
!  unix? F
! os: Windows_NT
! username: myname
! computername: DESKTOP-O9ELSIT
! HOME: C:\Users\myname
!
! Windows Subsystem for Linux output:
!  unix? T
! HOSTTYPE: x86_64
! LOGNAME: myname
! HOME: /home/myname
