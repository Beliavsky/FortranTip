module m
implicit none
type :: vec
   real, allocatable :: x(:)
end type vec
contains
function ran(n) result(xran)
integer, intent(in) :: n
real :: xran(n)
call random_number(xran)
end function ran
!
elemental function moment(v,m) result(xmom)
! return the nth moment of the array component of v
type(vec), intent(in) :: v
integer  , intent(in) :: m
real                  :: xmom
real                  :: xmean
integer               :: n
n = max(1,size(v%x))
xmean = sum(v%x)/n
xmom  = sum((v%x-xmean)**m)/n
end function moment
end module m
!
program main
use m, only: moment,vec,ran
implicit none
integer            :: i, nmom=4
type(vec)          :: v
character (len=20) :: fmt = "(a10,*(f8.4))"
v = vec(x = ran(10**4))
! central moments of uniform distribution
print "(a10,*(i8))","moment",(i,i=1,nmom)
print fmt,"sim",moment(v,[(i,i=1,nmom)])
print fmt,"true",0.0,1/12.0,0.0,1/80.0
end program main
! sample output:
!     moment       1       2       3       4
!        sim  0.0000  0.0836  0.0000  0.0125
!       true  0.0000  0.0833  0.0000  0.0125
