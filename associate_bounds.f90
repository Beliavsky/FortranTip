program associate_bounds
implicit none
real :: m(-2:3,0:9)
associate (a => m, &    ! whole array
           b => m(:,:)) ! array section
   print*,lbound(a) ! -2 0 -- same as m
   print*,lbound(b) !  1 1
end associate
end program associate_bounds
