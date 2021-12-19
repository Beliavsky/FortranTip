! Demonstrate merge
program xmerge
implicit none
integer :: i
do i=-1,1
   print*,i
   ! "zero" must be padded to have same length as "positive" 
   print*,merge("negative",merge("zero    ","positive",i==0),i<0)
end do
end program xmerge
