module m
implicit none
contains
pure integer function twice(i)
integer, intent(in) :: i
twice = 2*i ! result has same name as function
end function twice
!
pure function double(i) result(j)
integer, intent(in) :: i
integer             :: j
j = 2*i ! result has different name from function
end function double
!
pure function double_vec(i) result(j)
integer, intent(in) :: i(:)
integer             :: j(size(i))
j = 2*i
end function double_vec
!
end module m
!
program test_func
use m, only: twice, double, double_vec
implicit none
print*,twice(3),double(3) ! 6 6 
print*,double_vec([3,4]) ! 6 8
end program test_func
