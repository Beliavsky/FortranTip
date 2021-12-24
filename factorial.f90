program factorial ! by @urbanjost
use, intrinsic :: iso_fortran_env, only : wp=>real64
integer, parameter :: n(*)=[0,1,5,11,170]
integer            :: j
   do j=1,size(n)
      write(*,'(*(g0,1x))')'factorial of', n(j),' is ', &
       & product([(real(i,kind=wp),i=1,n(j))]),         &
       & ' or ',                                        &
       & gamma(real(n(j)+1,kind=wp))
   enddo
end program factorial
! output:
! factorial of 0  is  1.0000000000000000  or  1.0000000000000000
! factorial of 1  is  1.0000000000000000  or  1.0000000000000000
! factorial of 5  is  120.00000000000000  or  120.00000000000000
! factorial of 11  is  39916800.000000000  or  39916800.000000000
! factorial of 170  is  0.72574156153079940E+307  or  0.72574156153080003E+307