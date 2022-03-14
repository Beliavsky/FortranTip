program open_units_limit ! creates up to 10000 files
implicit none
integer, parameter           :: nunits = 10**4
character (len=*), parameter :: prefix = "temp_", suffix = ".txt"
integer                      :: i,iu,ierr
character (len=100)          :: fname
do i=1,nunits
   iu = 9 + i
   write (fname,"(a,i0,a)") prefix,i,suffix 
   ! having set file name, connect it to a new unit number
   open (unit=iu,file=trim(fname),action="write",iostat=ierr)
   if (ierr /= 0) then
      write (*,*) "could not connect unit for i =",i
      error stop
   end if
   write (iu,*) i ! write data
end do
write (*,*) "# units connected =",nunits
end program open_units_limit
! Windows Intel Fortran output:
! # units connected =       10000
! Windows gfortran output:
!  could not connect unit for i =        2046
! WSL2 gfortran output:
! could not connect unit for i =        1022