program test_execute_command_line
implicit none
integer :: exitstat
! Windows command below -- use ls on Linux
call execute_command_line("dir > temp.txt",exitstat=exitstat) 
print*,"after 'dir > temp.txt', exitstat =",exitstat
call execute_command_line("abc",exitstat=exitstat)
print*,"after 'abc', exitstat =",exitstat
end program test_execute_command_line
! output on Windows:
!  after 'dir > temp.txt', exitstat =           0
! 'abc' is not recognized as an internal or external command,
! operable program or batch file.
!  after 'abc', exitstat =           1