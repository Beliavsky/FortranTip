program advance_no
implicit none
integer            :: i,j
integer, parameter :: n = 4, vec(n) = [2,3,4,5]
real               :: mean
write (*,"('enter 2 numbers: ')",advance="no") ! cursor appears on same line
read (*,*) i,j 
write (*,"(a,i0)") "sum is ",i+j
! enter 2 numbers: 2 3
! sum is 5
mean = sum(vec)/real(n)
write (*,"('mean of ',*(i0,1x))",advance="no") vec
write (*,"('is ',f0.3)") mean ! mean of 2 3 4 5 is 3.500
! if # of elements of the first type is known, can use repeat edit descriptor:
write (*,"('mean of ',4(i0,1x),'is ',f0.3)") vec,mean ! same output
! alternative one-liner with the general g format giving same output:
write (*,"('mean of ',*(g0.4,1x))") vec,"is",mean
! line below crashes at run time if uncommented 
! since i0 format does not match real variable "mean"
! write (*,"('mean of ',*(i0,1x),' is ',f0.3)") vec,sum(vec)/real(n)
end program advance_no
