program direct_access
implicit none
integer, parameter :: n = 10**7,  & ! # of records
                      nreals = 2, & ! values per record
              iu = 10, ntimes = 7, ndt = ntimes - 1, nlen = 35
character (len=*), parameter :: unformatted_file = "temp.bin", &
   unformatted_seq_file = "temp_seq.bin",formatted_seq_file = "temp_seq.txt"
integer :: i,iol
real :: xmat(n,nreals),ymat(n,nreals),xlast(nreals),times(ntimes),dt(ndt)
character (len=nlen) :: labels(ndt)
call random_number(xmat)
inquire (iolength=iol) xmat(1,:) ! store record length in iol
print*,"n, nreals =",n,nreals
print*,"iol=",iol
call cpu_time(times(1))
! write unformatted direct
open (unit=iu,file=unformatted_file,access="direct", &
      recl=iol,action="write")
do i=1,n
   write (iu,rec=i) xmat(i,:)
end do
close (iu)
call cpu_time(times(2))
open (unit=iu,file=unformatted_file,access="direct", &
      recl=iol,form="unformatted",action="read")
! read the last record without looping over previous records
read (iu,rec=n) xlast 
print*,xmat(n,:),xlast
close (iu)
call cpu_time(times(3))
! write unformatted stream
open (unit=iu,file=unformatted_seq_file,form="unformatted", &
      access="stream",action="write")
write (iu) xmat
close (iu)
call cpu_time(times(4))
! read unformatted stream
open (unit=iu,file=unformatted_seq_file,form="unformatted", &
      access="stream",action="read")
read (iu) ymat
print*,xmat(n,:),ymat(n,:)
close (iu)
call cpu_time(times(5))
! write formatted sequential
open (unit=iu,file=formatted_seq_file,action="write")
do i=1,n
   write (iu,*) xmat(i,:)
end do
close (iu)
call cpu_time(times(6))
! read formatted sequential
open (unit=iu,file=formatted_seq_file,action="read")
do i=1,n
   read (iu,*) ymat(i,:)
end do
print*,xmat(n,:),ymat(n,:)
call cpu_time(times(7))
dt = times(2:) - times(:ntimes-1)
labels = [character (len=nlen) :: &
"write unformatted direct","read unformatted direct", &
"write unformatted stream","read unformatted stream", &
"write formatted sequential","read formatted sequential"]
print "(/,a35,1x,a9)", "task","time"
print "(a35,1x,f9.6)",(trim(labels(i)),dt(i),i=1,ndt)
end program direct_access
