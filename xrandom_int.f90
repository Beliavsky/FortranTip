program xrandom_int
implicit none
integer, parameter :: n = 10**6 ! # of random integers
integer, parameter :: imax = 5 ! maximum random integer (min is 1)
real :: xran(n)
integer :: iran(n),i
call random_seed()
call random_number(xran) ! generate uniform deviates
iran = 1 + imax*xran     ! transform uniform deviates to random integers from 1 to imax
print*,"#samples =",n
print*,"min, max random integer",1,imax
print*,"# outside range =",count(iran < 1 .or. iran > imax) ! should be zero
print "(/,2a10)", "i","count"
do i=1,imax
   print "(2i10)", i,count(iran==i)
end do
end program xrandom_int