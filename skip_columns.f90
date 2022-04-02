program skip_columns
implicit none
integer, parameter  :: nskip = 2, nread = 4, n = nskip + nread
integer             :: i,v(nread),iter
character (len=1)   :: dum
character (len=100) :: text
print "(a,2(1x,i0))","#skip, #read =",nskip,nread
do iter=1,2
   if (iter == 1) then ! space-delimited
      write (text,"(*(i0,:,1x))") [(10*i,i=1,n)]
   else                ! comma-delimited
      write (text,"(*(i0,:,','))") [(10*i,i=1,n)]
   end if
   print*,"text = '" // trim(text) // "'"
   read (text,*) (dum,i=1,nskip),v ! skip first nskip fields
   ! In practice one would read from a unit number 
   ! connected to a file.
   print "(a,*(1x,i0))","v =",v
end do
end program skip_columns
! output:
! #skip, #read = 2 4
!  text = '10 20 30 40 50 60'
! v = 30 40 50 60
!  text = '10,20,30,40,50,60'
! v = 30 40 50 60
