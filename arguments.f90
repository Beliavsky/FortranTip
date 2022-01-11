module m
implicit none
contains
subroutine print_sum(i,j,k)
integer, intent(in), optional :: i,j,k
integer                       :: sum_arg
character (len=*), parameter  :: fmt = "(a,1x,i0,1x)"
sum_arg = 0
if (present(i)) then
   write (*,fmt,advance="no") "i =",i
   sum_arg = sum_arg + i
end if
if (present(j)) then
   write (*,fmt,advance="no") "j =",j
   sum_arg = sum_arg + j
end if
if (present(k)) then
   write (*,fmt,advance="no") "k =",k
   sum_arg = sum_arg + k
end if
write (*,fmt) "sum is",sum_arg
end subroutine print_sum
end module m

program main ! demonstrate positional and named arguments
use m, only: print_sum
implicit none
call print_sum(2,3,4)       ! positional arguments
call print_sum(i=2,j=3,k=4) ! named arguments
call print_sum(k=4,j=3,i=2) ! can invoke named arguments in any order
call print_sum(2,3,k=4)     ! named arguments can follow positional ones
call print_sum(2,k=4)       ! need named argument to skip an argument
! call print_sum(j=3,4) 
! invalid -- positional arguments cannot follow named ones
end program main    
! output 
! i = 2 j = 3 k = 4 sum is 9
! i = 2 j = 3 k = 4 sum is 9
! i = 2 j = 3 k = 4 sum is 9
! i = 2 j = 3 k = 4 sum is 9
! i = 2 k = 4 sum is 6