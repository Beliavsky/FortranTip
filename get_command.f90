program add_reals
! add numbers entered on command line
implicit none
character (len=100) :: text, arg
integer             :: i,narg
real                :: x,xsum
logical, parameter  :: echo_input = .true.
if (echo_input) then
   call get_command(text)
   print "(a)","command is '" // trim(text) // "'"
end if
narg = command_argument_count() ! # of command line arguments
xsum = 0.0
do i=1,narg ! loop over command line arguments
   call get_command_argument(i,arg) ! arg is i'th argument
   read (arg,*) x ! convert character arg to real
   xsum = xsum + x
end do
print "('sum of ',i0,' numbers = ',f0.4)", narg,xsum
end program add_reals
! sample run:
! command is 'a.exe 4.0 5.0 6.0'
! sum of 3 numbers = 15.0000