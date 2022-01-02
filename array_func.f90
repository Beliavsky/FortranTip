module m
implicit none
contains
pure function twice(vec) result(vec2)
! result size depends on argument size
integer, intent(in) :: vec(:)
integer             :: vec2(size(vec))
vec2 = 2*vec
end function twice 
!
pure function fibonacci(n) result(vec)
! result size is an argument
integer, intent(in) :: n
integer             :: vec(n)
integer             :: i
if (n < 1) return
vec(1) = 0
if (n < 2) return
vec(2) = 1
do i=3,n
   vec(i) = vec(i-1) + vec(i-2)
end do
end function fibonacci
!
pure function even(vec) result(even_num)
! If the size of the function RESULT depends on the input
! in a more complicated way, it can be an allocatable array 
! return the even elements in vec(:)
integer, intent(in)  :: vec(:)
integer, allocatable :: even_num(:)
even_num = pack(vec, mod(vec,2)==0) ! allocation on assignment
end function even
end module m
!
program array_func
use m, only: twice, fibonacci, even
implicit none
character (len=*), parameter :: fmt="(*(i0,:,1x))"
print fmt,twice([1,4]) ! 2 8
print fmt,fibonacci(6) ! 0 1 1 2 3 5
print fmt,even([1,4,9,16]) ! 4 16
end program array_func
