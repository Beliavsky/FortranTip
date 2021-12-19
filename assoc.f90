! Associate creates an alias for expressions or variables.
program assoc
implicit none
integer, allocatable :: u(:)
u = [4,9]
associate (v => u)
v = v - 2
print*,v ! 2 7
print*,u ! 2 7
associate (w => [4,9])
print*,w
! w = w - 2 ! illegal since w set to a constant expression
end associate
end associate
end program assoc