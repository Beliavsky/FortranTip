program direct_access ! write and read a direct access file
implicit none
integer, parameter :: nrec = 10**6,  & ! # of records
                      nreals = 2, &    ! values per record
                      iu = 10          ! unit number
integer            :: irec,iol
real               :: xmat(nrec,nreals),xlast(nreals)
character (len=*), parameter :: unfmt_file = "temp.bin", &
   fmt_g = "(*(g0,:,1x))"
call random_number(xmat) ! each row of xmat will be a record
inquire (iolength=iol) xmat(1,:) ! store record length in iol
print fmt_g,"record length iol =",iol
! record length must be specified for direct access
open (unit=iu,file=unfmt_file,access="direct",recl=iol, &
      action="write") 
do irec=nrec,1,-1 ! records can written in any order
   write (iu,rec=irec) xmat(irec,:) ! record number irec
end do
close (iu)
open (unit=iu,file=unfmt_file,access="direct",recl=iol, &
      form="unformatted",action="read")
! read the last record without looping over previous records
read (iu,rec=nrec) xlast 
print fmt_g,xmat(nrec,:),xlast ! verify it was correctly
end program direct_access
! sample output:
! record length iol = 8
! 0.717662573 0.343180299E-1 0.717662573 0.343180299E-1
