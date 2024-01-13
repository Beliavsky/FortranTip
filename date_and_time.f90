program xdate_and_time
implicit none
integer, parameter :: nval = 8
integer            :: ival(nval)
character (len=8)  :: date
character (len=10) :: time
character (len=5)  :: zone
call date_and_time(date=date,time=time,zone=zone,values=ival)
write (*,"(100(1x,a8))") "year","month","day","diff_UTC","hour","minute", &
                         "seconds","millisec"
write (*,"(100(1x,i8))") ival
! given values, you can create your own date and time format
write (*,"(/,i4.4,2('-',i2.2),1x,i2.2,2(':',i2.2))") ival([1,2,3,5,6,7])
write (*,"(/,*(a,:,1x))") date, time, zone ! character variables from date_and_time
end program xdate_and_time
! output (diff_UCT is -300 for me since EST is 5 hours behind)
!
!     year    month      day diff_UTC     hour   minute  seconds millisec
!     2024        1       13     -300       11       16       15      134
!
! 2024-01-13 11:16:15
!
! 20240113 111615.134 -0500
