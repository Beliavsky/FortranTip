! GitHub FortranTip print_stats.f90
module m
use iso_c_binding, only: c_float, c_int
implicit none
contains
subroutine print_stats(n,x) bind(c)
integer(kind=c_int)  , intent(in)  :: n
real(kind=c_float)   , intent(in)  :: x(n)
if (n < 1) return
print "(a,*(1x,f0.1))","min, max, mean =",minval(x),maxval(x),sum(x)/n
end subroutine print_stats
end module m
