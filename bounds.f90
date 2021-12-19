! Fortran arrays can have any lower bound. The default is 1
! lbound and ubound are intrinsics that return the lower and upper bounds
! of an array
program bounds
implicit none
integer :: v(-1:1) = [1,-2,3]
integer :: mat(-1:1,3)
print*,lbound(v),ubound(v),size(v) ! -1 1 3
print*,sum(v) ! 2
print*,sum(v,mask=v>0) ! 4 -- sum excludes -2
print*,lbound(mat),ubound(mat),size(mat) ! -1 1 1 3 9
end program bounds
