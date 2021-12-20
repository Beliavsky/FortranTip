! To READ or WRITE data from a file, it must first be connected to a unit. The newunit specifier,
! introduced in Fortran 2008, finds a free unit number. The program below writes some data to
! a file and then reads it back. When the number of records in a file is unknown, set and check
! the IOSTAT of READ, as shown.
program read_write
implicit none
integer          , parameter   :: max_read = 10**6
integer                        :: i,ierr,iunit,nread
integer          , allocatable :: vec_write(:),vec_read(:)
character (len=*), parameter   :: data_file = "temp.txt"
vec_write = [1,4,9]
! connect file to unit iunit for writing
open (newunit=iunit,file=data_file,action="write",status="replace")
do i=1,size(vec_write)
   write (iunit,*) vec_write(i) ! write one element of vec_write per line
end do
close (iunit) ! close the connection to the file
! connect file to unit iunit for reading
open (newunit=iunit,file=data_file,action="read",status="old")
allocate (vec_read(max_read))
nread = max_read
do i=1,max_read
   read (iunit,*,iostat=ierr) vec_read(i) ! read one element of vec_read per line
   if (ierr /= 0) then ! reached end of file
      nread = i-1
      exit
   end if
end do
print*,"#read =",nread
print*,"data read =",vec_read(:nread)
! data read = 1 4 9
end program read_write
