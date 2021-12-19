! sum and other array functions have an optional dim argument
program main
implicit none
integer :: v(2,3)   ! declare 2x3 matrix
v(1,:) = [1,2,3]    ! set 1st row
v(2,:) = 10*v(1,:)  ! set 2nd row to [10,20,30]
print*,sum(v)       ! sum all elements: 66
print*,sum(v,dim=1) ! sum each row: 6 60
print*,sum(v,dim=2) ! sum each col: 11 22 33
end program main
