program atoi_vs_read ! GitHub FortranTip atoi_vs_read.f90
use, intrinsic :: iso_c_binding, only: c_char, c_null_char
implicit none
interface ! enable call to atoi() from C standard library
   function atoi(in) bind(c)
   use, intrinsic    :: iso_c_binding
   integer(c_int)    :: atoi
   character(c_char) :: in(*)
   end function
end interface
integer :: j,iran
integer, parameter :: nread = 10**7, nt = 3
character(len=10,kind=c_char), allocatable :: digits(:), cdigits(:)
real :: times(nt),dt(nt-1),xran
integer, allocatable :: iran_c(:),iran_f(:)
allocate (digits(nread),cdigits(nread),iran_c(nread),iran_f(nread))
do j=1,nread ! write random integers to strings
   call random_number(xran)
   iran = 10**6*(xran-0.5) ! random integer
   write (digits(j),"(i0)") iran ! write integer to string
   cdigits(j) = trim(digits(j)) // c_null_char ! create C string
end do
call cpu_time(times(1))
do j=1,nread ! read integers from C strings using C atoi
   iran_c(j) = atoi(cdigits(j))
end do
call cpu_time(times(2))
do j=1,nread ! read integers from strings using internal read
   read (digits(j),*) iran_f(j)
end do
call cpu_time(times(3))
dt = times(2:nt)-times(1:nt-1)
print "(4a8)","","atoi","read","ratio"
print "(a8,3f8.4)","times",dt,dt(2)/dt(1)
print "(/,*(a8))","#","mean","min","max","first","last","maxdiff"
! Check that same integers are read
print "(i8,f8.1,*(i8))",nread,sum(dble(iran_c))/nread,minval(iran_c), &
 maxval(iran_c),iran_c(1),iran_c(nread),maxval(abs(iran_c-iran_f))
end program atoi_vs_read
! output on WSL2 using gfortran-11 -O3 -march=native atoi_vs_read.f90
!             atoi    read   ratio
!    times  0.2412  3.7282 15.4600
! 
!        #    mean     min     max   first    last maxdiff
! 10000000  -126.1 -500000  499999  -51059  -73639       0

