module m
implicit none
contains
pure subroutine grow_vec(x,xadd) ! append xadd(:) to x(:)
real, allocatable, intent(in out) :: x(:)
real             , intent(in)     :: xadd(:)
real, allocatable                 :: temp(:)
integer                           :: nx
if (.not. allocated(x)) allocate (x(0))
nx   = size(x)
allocate (temp(nx + size(xadd)))
temp(:nx) = x
temp(nx+1:) = xadd
call move_alloc(temp,x)
end subroutine grow_vec
end module m
!
program grow_array
use m, only: grow_vec
implicit none
real   , allocatable :: a(:),xran(:)
integer, parameter   :: nmax = 3*10**6, ngrow = 1000, nt = 4
integer              :: na
real                 :: t(nt)
logical              :: print_check
allocate (xran(nmax))
call random_number(xran)
print_check = .false.
if (print_check) print "(2a15)","size","max|a-xran|"
call cpu_time(t(1))
allocate (a(0))
na = 0
do ! grow array in a subroutine with copying and move_alloc
   call grow_vec(a,xran(na+1:na+ngrow))
   na = size(a)
   if (na >= nmax) exit
end do
if (print_check) print "(i15,f15.10)",size(a),maxval(abs(a-xran))
call cpu_time(t(2))
a = [real ::]
na = 0
do ! grow array using RESHAPE -- suggested by FortranFan
   a = reshape(a,[na+ngrow],pad=xran(na+1:na+ngrow))
   na = size(a)
   if (size(a) >= nmax) exit
end do
if (print_check) print "(i15,f15.10)",size(a),maxval(abs(a-xran))
call cpu_time(t(3))
a = [real ::]
na = 0
do ! grow array using allocation on assignment (AoA)
   a = [a,xran(na+1:na+ngrow)]
   na = size(a)
   if (size(a) >= nmax) exit
end do
if (print_check) print "(i15,f15.10)",size(a),maxval(abs(a-xran))
call cpu_time(t(4))
print "(/,4a15)","method","move_alloc","reshape","AoA"
print "(a15,3f15.3)","time(s)",t(2:nt) - t(1:nt-1)
end program grow_array
! sample gfortran -O3 output on Windows:
!          method     move_alloc        reshape            AoA
!         time(s)          4.750         13.734         18.547
! sample gfortran -O3 output on WSL2:
!          method     move_alloc        reshape            AoA
!         time(s)          3.480          4.528          4.458