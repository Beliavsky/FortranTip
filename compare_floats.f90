program compare_floats ! from urbanjost
implicit none
! below might test as equal
! real :: A(3)=[1.0,2.0,3.0], B(3)=[1.0,2.0,2.9999999999999]  
real :: A(3)=[1.0,2.0,3.0], B(3)=[1.0,2.0,2.999999] ! this should be close enough
real :: tolerance=0.00001  ! just a sample tolerance
if (all(A==B)) then  ! testing for exact matches can be problematic
   write(*,*) "A and B are equal"
else if (all(abs(A-B) < tolerance)) then
   write(*,*) "A and B are close enough to equal"
else
   write(*,*) "A and B are NOT equal"
end if
! output: A and B are close enough to equal
end program compare_floats