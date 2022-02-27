module reg_mod
implicit none
contains
subroutine linear_regression(x,y,slope,intcep,ierr)
! regress y(:) on x(:), where size(x) == size(y)
real   , intent(in)            :: x(:),y(:)
real   , intent(out)           :: slope,intcep
integer, intent(out), optional :: ierr
integer                        :: ierr_,n
real                           :: xmean,ymean
if (present(ierr)) ierr = 0
n = size(x)
ierr_ = findloc([n>1, size(y)==n],.false.,dim=1)
if (ierr_ /= 0) then
   if (present(ierr)) then
      ! if error flag passed, set it and return
      ierr = ierr_
      return
   else
      ! otherwise stop
      print*,"in linear_regression, ierr_ =",ierr_
      error stop
   end if
end if
xmean  = sum(x)/n
ymean  = sum(y)/n
slope  = sum((x-xmean)*(y-ymean))/sum((x-xmean)**2)
! should check that denominator above is nonzero
intcep = ymean - slope*xmean
end subroutine linear_regression
end module reg_mod
!
program test_reg
use reg_mod, only: linear_regression
implicit none
integer, parameter :: n = 10**3
real :: x(n),y(n),noise(n),slope,intcep
integer :: ierr
call random_seed()
call random_number(x)
call random_number(noise)
y = 5*x + 3 + (noise - 0.5)
call linear_regression(x,y,slope,intcep)
print "('slope, intercept =',2(1x,f0.4))",slope,intcep
! pass error flag ierr
call linear_regression(x(2:),y,slope,intcep,ierr) 
if (ierr /= 0) print*,"after linear_regression, ierr =",ierr
! no error flag passed -- stop in procedure upon error
call linear_regression(x(2:),y,slope,intcep)
end program test_reg
! sample output:
! slope, intercept = 4.9824 3.0011
!  after linear_regression, ierr =           2
!  in linear_regression, ierr_ =           2
! ERROR STOP 