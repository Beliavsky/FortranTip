! Demonstrate the ** exponentiation operator, which is elemental
program main
implicit none
integer :: i
print*,1.2**2               ! 1.44000006
print*,[1.0,1.1,1.2,1.3]**2 ! 1.00000000 1.21000004 1.44000006 1.68999982
print*,2**[0,1,2,3] ! 1 2 4 8
print*,2**[(i,i=0,3)] ! 1 2 4 8
end program main