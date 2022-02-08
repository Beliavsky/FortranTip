program concatenate
implicit none
integer, parameter :: n1 = 2, n2 = 3
integer :: imat(n1,n2),ivec(n1),i
integer, allocatable :: jmat(:,:)
imat(1,:) = [10,11,12]
imat(2,:) = [20,21,22]
ivec = 10*imat(:,n2) ! [120,220]
jmat = reshape([imat,ivec,4,9],[n1,n2+2])
do i=1,size(jmat,1)
   print "(*(i5))",jmat(i,:)
end do
end program concatenate
! output:
!   10   11   12  120    4
!   20   21   22  220    9
