program alloc_errmsg
use iso_fortran_env, only: int64
implicit none
integer (kind=int64) :: n
integer :: ierr,ipow
real, allocatable :: x(:)
character (len=100) :: errmsg
allocate (x(2))
allocate (x(3),stat=ierr,errmsg=errmsg)
print*,"here ierr =",ierr," errmsg = ",trim(errmsg)
n = 10**8
do ipow=1,5
   ierr = 0
   if (allocated(x)) deallocate(x)
   allocate (x(n),stat=ierr,errmsg=errmsg)
   if (ierr /= 0) then
      print "(3(1x,a,1x,i0),2a)","ipow =",ipow,"n =",n,"ierr =",ierr," errmsg = ",trim(errmsg)
      exit
   end if
   call random_number(x)
   print "(3(1x,a,1x,i0),a,f0.6)","ipow =",ipow," n =",n," size(x) =",size(x)," maxval(x) = ",maxval(x)
   n = n*10
end do
end program alloc_errmsg