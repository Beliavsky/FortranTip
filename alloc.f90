! Demonstrate allocation on assignment, "plain" allocate and allocate with source and mold, and deallocate
program alloc
implicit none
integer, allocatable :: v(:)
v = [4,9]     ! allocation upon assignmment
deallocate(v) ! necessary for line below to work -- cannot allocate an array that is already allocated
allocate (v,source=[4,9]) ! same effect as v = [4,9]
print*,v                  ! 4 9
deallocate(v)
allocate (v(2))
print*,v                  ! random output since v not set
deallocate(v)
allocate (v,mold=[4,9])   ! same effect as allocate (v(2)) -- does not set the elements of v
print*,v                  ! random output since v not set
end program alloc