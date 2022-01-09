program test_dimension
implicit none
real, dimension(3,4) :: x,y,z(5,6)
! Line above is legal but confusing. It should be written
! real, dimension(3,4) :: x,y
! real :: z(5,6)
character (len=*), parameter :: fmt = "(2(1x,i0))"
print fmt,shape(x),shape(y),shape(z)
end program test_dimension
! output
! 3 4
! 3 4
! 5 6
