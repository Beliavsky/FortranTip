program test_spread ! demonstrate SPREAD intrinsic
implicit none
integer :: ivec(2) = [4,7], ident(2,2) = &
  reshape([1,0,0,1],[2,2]) ! 2x2 identity matrix
call display(spread(ivec,dim=1,ncopies=3))
! copies rows since dim = 1
!  4 7
!  4 7
!  4 7
call display(spread(ivec,dim=2,ncopies=3))
! copies columns since dim = 2
!  4 4 4
!  7 7 7
call display(ident + spread(ivec,dim=2,ncopies=2))
! add column copies of ivec to identity matrix
!  5 4 = 1 0 + 4 4 
!  7 8   0 1   7 7
contains
!
subroutine display(mat) ! print matrix by rows
integer, intent(in) :: mat(:,:)
integer             :: i
do i=1,size(mat,1)
   print "(*(i2))", mat(i,:)
end do
print*
end subroutine display
end program test_spread
