! Demonstrate optional arguments and the random_number intrinsic
program optional_arg
implicit none
real :: x(1000000)
call random_seed()
call random_number(x) ! generate uniform random deviates on (0,1]
print*,stdev(x) 
print*,stdev(x,sum(x)/size(x))       ! using the optional argument
print*,stdev(x,xmean=sum(x)/size(x)) ! often good to name an optional argument
contains
!
pure function stdev(x,xmean) result(xstd)
real, intent(in)           :: x(:)    ! data for which standard deviation computed
real, intent(in), optional :: xmean   ! known mean if supplied
real                       :: xstd
real                       :: xmean_
integer                    :: n
n = size(x)
if (n < 2) then
   xstd = -1.0 ! signal bad input
   return
end if
! Create a shadow local variable for the optional argument -- a common pattern.
if (present(xmean)) then
   xmean_ = xmean
else
   xmean_ = sum(x)/n
end if
xstd = sqrt(sum((x-xmean_)**2)/(n-1))
end function stdev
end program optional_arg
