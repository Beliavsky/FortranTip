! Fortran array sections
program section
implicit none
integer, parameter :: v(3) = [10,20,30]
print*,v(1:2) ! output 10 20
print*,v(:2)  ! 10 20
print*,v(2:3) ! 20 30
print*,v(2:)  ! 20 30
print*,v(::2) ! 10 30 -- stride of 2
print*,v(1:3:2) ! same as above
print*,v(3:1:-1) ! 30 20 10 -- negative stride
end program section
