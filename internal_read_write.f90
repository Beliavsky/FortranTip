program internal_io ! code and tip from urbanjost: use internal I/O to 
implicit none       ! convert from character to real and the reverse
character (len=80) :: text
real               :: value
integer            :: ios
character(len=256) :: message
text = "123.4e2"
read (text,*,iostat=ios,iomsg=message) value ! convert character to real
if (ios /= 0) then
   write(*,*) "ERROR: could not obtain numeric value from " // trim(text)
   write(*,*) "     : " // trim(message)
else
   write(*,*) "value = ",value
end if
write (text,"(3g0)") "'", 1.0d0/3.0d0, "'" ! convert real to character
write (*,*) "text = ",trim(text)
end program internal_io
! gfortran output:
!  value =    12340.0000    
!  text = '0.33333333333333331'