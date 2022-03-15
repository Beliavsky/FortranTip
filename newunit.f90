program test_newunit
implicit none
integer :: i,iu
character (len=20) :: fname
do i=1,2
   write (fname,"(i0,'_junk.txt')") i
   open (newunit=iu,file=fname,action="write")
   write (*,"('connected ',a,' to unit ',i0)") fname,iu
   write (iu,*) i,i**2
   ! close iu in a real program
end do
end program test_newunit