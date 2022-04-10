program test_move_alloc
implicit none
integer, parameter :: n = 1000, nadd = 100
real, allocatable :: x(:),tmp(:)
allocate (x(n),tmp(n+nadd))
call random_number(x)
print*,"size(x), sum(x)=",size(x),sum(x)
tmp(1:n)        = x
tmp(n+1:n+nadd) = 0.0
call move_alloc(from=tmp,to=x)
print*,"allocated(tmp) =",allocated(tmp)
print*,"size(x), sum(x)=",size(x),sum(x)
end program test_move_alloc
! sample output:
