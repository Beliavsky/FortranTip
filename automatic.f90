! If allocation errors must be handled, use allocatable rather than automatic arrays in procedures, 
! and check the stat of allocate.
subroutine foo(x)
implicit none
real, intent(in)  :: x(:)
real              :: y(size(x)) ! automatic array -- program crashes if there is no memory for it
real, allocatable :: z(:)
integer           :: ierr
allocate (z(size(x)),stat=ierr)
if (ierr /= 0) then ! allocate errors can be handled
   print*,"could not allocate z in foo"
   return
end if
end subroutine foo
