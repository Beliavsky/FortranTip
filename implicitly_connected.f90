program implicit_file_connection
implicit none
write (10,*) "hello" 
! writes "hello" to fort.10 on most systems
close (10) ! not strictly necessary
open (unit=10,file="temp.txt",action="write")
write (10,*) "hello" ! writes to temp.txt
end program implicit_file_connection