module matrix_mult_mod
implicit none
contains
subroutine mmult_1(a,b,c) ! set ierr with if-elseif: 8 lines
real   , intent(in)  :: a(:,:) ! (m,n) = shape
real   , intent(in)  :: b(:,:) ! (n,p)
real   , intent(out) :: c(:,:) ! (m,p)
integer              :: ierr
ierr = 0
if (size(a,1) /= size(c,1)) then
   ierr = 1
else if (size(a,2) /= size(b,1)) then
   ierr = 2
else if (size(b,2) /= size(c,2)) then
   ierr = 3
end if
if (ierr /= 0) then
   print*,"in mmult_1, ierr =",ierr," returning"
   return
else
   print*,"in mmult_1, ierr = 0, continuing" ! would not appear in a real code
end if
c = matmul(a,b)
end subroutine mmult_1
!
subroutine mmult_2(a,b,c) ! set ierr with findloc: 1 line
! matrix multiplication
real   , intent(in)  :: a(:,:) ! (m,n) = shape
real   , intent(in)  :: b(:,:) ! (n,p)
real   , intent(out) :: c(:,:) ! (m,p)
integer              :: ierr
! set ierr to the position of the first false element if any, otherwise 0
ierr = findloc([size(a,1)==size(c,1),size(a,2)==size(b,1),size(b,2)==size(c,2)],.false.,dim=1)
if (ierr /= 0) then
   print*,"in mmult_2, ierr =",ierr," returning"
   return
else
   print*,"in mmult_2, ierr = 0, continuing" ! would not appear in a real code
end if
c = matmul(a,b)
end subroutine mmult_2
end module matrix_mult_mod
!
program main
use matrix_mult_mod, only: mmult_1, mmult_2
implicit none
integer, parameter :: m = 3, n = 5, p = 10
real :: a(m,n),b(n,p),c(m,p)
call mmult_1(a(2:,:),b,c)
call mmult_2(a(2:,:),b,c)
call mmult_1(a(:,2:),b,c)
call mmult_2(a(:,2:),b,c)
call mmult_1(a,b(:,2:),c)
call mmult_2(a,b(:,2:),c)
call mmult_1(a,b,c)
call mmult_2(a,b,c)
end program main
