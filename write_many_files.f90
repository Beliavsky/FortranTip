program write_many_files
implicit none
integer, parameter           :: iu = 10, nobs = 1000, nfiles = 3
character (len=*), parameter :: prefix = "temp_", suffix = ".txt"
integer                      :: i
real                         :: x(nobs)
character (len=100)          :: fname
do i=1,nfiles
   call random_number(x)
   write (fname,"(a,i0,a)") prefix,i,suffix       ! set file name
   open (unit=iu,file=trim(fname),action="write") ! connect file to unit
   write (iu,*) minval(x),maxval(x),sum(x)/nobs   ! write data
   close (iu)                                     ! close unit
end do
end program write_many_files
! creates files temp_1.txt, temp_2.txt, temp_3.txt
