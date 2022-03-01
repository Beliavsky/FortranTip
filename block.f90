module block_mod 
! Demonstrate BLOCK construct, which has nothing to do with COMMON BLOCK.
implicit none
contains
pure function correlation_matrix(x) result(corr)
real, intent(in) :: x(:,:)
real             :: corr(size(x,2),size(x,2))
real             :: xstd(size(x,1),size(x,2))
integer          :: i2,j2,n1,n2
n1 = size(x,1)
n2 = size(x,2)
calc_xstd: block ! naming the block allows early exit
   real :: mean,sqrt_sumsq,vec(n1) ! do not exist outside block
   if (n1 < 1) exit calc_xstd ! leave block early to avoid division by 0
   do i2=1,n2
      ! variables x and xstd declared outside block are accessible
      mean = sum(x(:,i2))/n1
      vec  = x(:,i2) - mean
      sqrt_sumsq = sqrt(sum(vec**2))
      xstd(:,i2) = vec/sqrt_sumsq ! standardized columns of x
   end do
end block calc_xstd
do i2=1,n2
   do j2=1,i2-1
      corr(i2,j2) = sum(xstd(:,i2)*xstd(:,j2)) ! lower diagonal     
   end do
   corr(i2,i2) = 1.0
end do
! FORALL can be masked. Line below copies lower diagonal to upper.
forall (i2=1:n2,j2=1:n2,j2>i2) corr(i2,j2) = corr(j2,i2)
end function correlation_matrix
end module block_mod
!
program main
use block_mod, only: correlation_matrix
implicit none
integer, parameter :: n1 = 1000, n2 = 3
real :: x(n1,n2),v(n1),corr(n2,n2)
integer :: i2
call random_seed()
call random_number(v)
call random_number(x)
forall (i2=1:n2) x(:,i2) = x(:,i2) + 2*v
corr = correlation_matrix(x)
print "('correlation matrix')"
do i2=1,n2
   write (*,"(*(f6.3))") corr(i2,:)
end do
end program main
! sample output:
! correlation matrix
!  1.000 0.787 0.791
!  0.787 1.000 0.803
!  0.791 0.803 1.000