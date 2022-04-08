program alloc_errmsg
use iso_fortran_env, only: int64
implicit none
integer (kind=int64) :: n ! use kind=int64 since huge(1) = 2147483647
integer              :: ierr,ipow
real, allocatable    :: x(:)
character (len=100)  :: errmsg
allocate (x(2))
allocate (x(3),stat=ierr,errmsg=errmsg) ! already allocated
print "(a,i0,2a)","here ierr = ",ierr," errmsg = '" // trim(errmsg) // "'"
do ipow=1,5 ! allocate larger arrays until error
   n = 10_int64**(7+ipow)
   ierr = 0
   if (allocated(x)) deallocate(x)
   allocate (x(n),stat=ierr,errmsg=errmsg)
   if (ierr /= 0) then
      print "(3(1x,a,1x,i0),a)","ipow =",ipow,"n =",n,"ierr =",ierr, &
            " errmsg = '" // trim(errmsg) // "'"
      exit
   end if
   call random_number(x)
   print "(3(1x,a,1x,i0),a,f0.8)","ipow =",ipow," n =",n, &
         " size(x) =",size(x)," maxval(x) = ",maxval(x)
end do
end program alloc_errmsg
! Intel Fortran output:
! here ierr = 151 errmsg = 'allocatable array is already allocated'
!  ipow = 1  n = 100000000  size(x) = 100000000 maxval(x) = .99999994
!  ipow = 2  n = 1000000000  size(x) = 1000000000 maxval(x) = .99999994
!  ipow = 3 n = 10000000000 ierr = 41 errmsg = 'insufficient virtual memory'