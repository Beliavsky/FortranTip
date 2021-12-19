! Demonstrate overloading with an interface and module procedures
module m
implicit none
interface mean
   module procedure mean_1d, mean_2d
end interface mean
contains
pure function mean_1d(x) result(y)
real, intent(in) :: x(:)
real             :: y
y = sum(x)/max(1,size(x))
end function mean_1d
!
pure function mean_2d(x) result(y)
real, intent(in) :: x(:,:)
real             :: y
y = sum(x)/max(1,size(x))
end function mean_2d
end module m
!
program main
use m, only: mean
implicit none
real :: x1(3),x2(2,3)
x1 = real([1,4,10])
x2(1,:) = x1
x2(2,:) = x1*3
print*,mean(x1),mean(x2) ! 5.0 10.0
end program main