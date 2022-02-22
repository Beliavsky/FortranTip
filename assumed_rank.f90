module m
implicit none
public :: mean,avg
! older way to have same name for function with multiple ranks
! is an interface with module procedures
interface avg
   module procedure avg_0,avg_1,avg_2
end interface avg
contains
function mean(x) result(y)
real, intent(in) :: x(..) ! assumed rank argument
real             :: y
select rank (x)
   rank (0)     ; y = x ! scalar case
   rank (1)     ; y = sum(x)/max(1,size(x))
   rank (2)     ; y = sum(x)/max(1,size(x))
   rank default ; stop "mean not implemented for rank > 2"
end select
end function mean
!
function avg_0(x) result(y) ! rank 0 argument
real, intent(in) :: x
real             :: y
y = x
end function avg_0
!
function avg_1(x) result(y) ! rank 1 argument
real, intent(in) :: x(:)
real             :: y
y = sum(x)/max(1,size(x))
end function avg_1
!
function avg_2(x) result(y) ! rank 2 argument
real, intent(in) :: x(:,:)
real             :: y
y = sum(x)/max(1,size(x))
end function avg_2
end module m
!
program test_assumed_rank
use m, only: avg  ! interface with module procedures
use m, only: mean ! function with assumed rank argument
implicit none
integer, parameter :: n1 = 1000, n2 = 5
real :: x(n1,n2)
character (len=*), parameter :: fmt="(*(f6.3))"
call random_seed()
call random_number(x)
! demonstrate rank 0, 1, 2 cases
print "(*(a6))","avg","mean","check"
print fmt,avg(x(1,1)),mean(x(1,1)),x(1,1) ! scalar
print fmt,avg(x(:,1)),mean(x(:,1)),sum(x(:,1))/n1 ! 1D
print fmt,avg(x),mean(x),sum(x)/(n1*n2) ! 2D          
end program test_assumed_rank
! works with gfortran and Intel Fortran
! sample output:
!    avg  mean check
!  0.662 0.662 0.662
!  0.507 0.507 0.507
!  0.506 0.506 0.506