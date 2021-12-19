! Define and call a subroutine
program optional_arg
implicit none
real :: x(1000000),xmean,xsd
call random_seed()
call random_number(x)   ! generate uniform random deviates on (0,1]
call stats(x,xmean,xsd) ! subroutine invoked with the call statement
print*,xmean,xsd
contains
!
pure subroutine stats(x,xmean,xsd)
real, intent(in)  :: x(:)  ! data for which stats computed
real, intent(out) :: xmean ! mean of x(:)
real, intent(out) :: xsd   ! standard deviation of x(:)
real, parameter   :: bad = -999.0
integer           :: n
n     = size(x)
! set outputs to bad value if there is insufficient data
xmean = bad
xsd   = bad
if (n < 1) return
xmean = sum(x)/size(x) ! enough data to compute mean
if (n < 2) return
xsd = sqrt(sum((x-xmean)**2)/(n-1)) ! enough data to compute standard deviation
end subroutine stats
end program optional_arg
