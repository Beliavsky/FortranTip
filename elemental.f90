! Elemental functions broadcast arguments

program elemental_func
implicit none
print*,area(3,4) ! 12
print*,area(3,[4,5]) ! 12 15
print*,area([3,4],[4,5]) ! 12 20
contains
integer elemental function area(length,width)
integer, intent(in) :: length,width
area = length*width
end function area
end program elemental_func
