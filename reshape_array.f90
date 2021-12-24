! RESHAPE returns an array with a different shape than the source array.
! The optional ORDER argument changes the order of elements of SOURCE from the usual
! column major. The optional PAD fills the result, with recycling,
! after source is exhausted.
program test_reshape
implicit none
integer, allocatable :: v(:),m(:,:)
v = [1,2,3,4,5,6]
m = reshape(source=v,shape=[2,3])
! fill m by columns
print*,m(1,:) ! 1 3 5
print*,m(2,:) ! 2 4 6
m = reshape(source=v,shape=[2,3],order=[2,1])
! fill m by rows
print*,m(1,:) ! 1 2 3
print*,m(2,:) ! 4 5 6
m = reshape(source=[0,0],shape=[2,3],order=[2,1],pad=[1,-1])
! pad m with [1,-1] after exhausting source
print*,m(1,:) !  0 0  1
print*,m(2,:) ! -1 1 -1
m = reshape(source=v,shape=[2,3],order=[2,1],pad=[1,-1])
! here pad is unused because size(source) equals product(shape)
print*,m(1,:) !  1 2 3
print*,m(2,:) !  4 5 6
end program test_reshape
