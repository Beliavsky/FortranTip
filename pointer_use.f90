program pointer_use
implicit none
integer, target :: i=2
integer, pointer :: p => null(), v(:) => null(), q
print*,associated(p), associated(v), &
       associated(q) ! undefined
p => i ! pointer p given target i
allocate(v(2)) ! v allocated 2 elements
v = [3,4]
print*,associated(p),associated(v) ! T T
print*,p,v ! 2 3 4
nullify(p) ! p no longer points to i
deallocate(v) ! memory allocated to v is released
print*,associated(p),associated(v) ! F F
end program pointer_use
! output with gfortran and g95
! F F T
! T T
! 2 3 4
! F F
! output with Intel Fortran and flang
! F F F
! T T
! 2 3 4
! F F
