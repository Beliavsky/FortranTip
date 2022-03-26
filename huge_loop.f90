program loop
implicit none
integer :: i
do i=1,huge(i)-1
   continue
end do
print "(a,i0)", "'do i=1,huge(i)-1' exits with i=", i
do i=1,huge(i) ! nonstandard
   ! gfortran -Wall says Warning: DO loop at (1) is undefined as it overflows
   ! without line below loop does not terminate with gfortran
   if (i == huge(i)) exit
end do
print"(a,i0)", "'do i=1,huge(i)' exits with i=", i
end program loop
! output: 
! 'do i=1,huge(i)-1' exits with i=2147483647
! 'do i=1,huge(i)' exits with i=2147483647