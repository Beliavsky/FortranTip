``` .f90
module fib_mod
implicit none
contains
elemental function fib(i) result(ifib)
integer, intent(in) :: i
integer             :: ifib,j,fib_old(2)
ifib = merge(0, 1, i<1)
if (i < 3) return
fib_old = [1,1]
do j=3,i
   ifib = fib_old(1) + fib_old(2)
   if (j == i) exit
   fib_old = [ifib,fib_old(1)]
end do
end function fib
end module fib_mod
!
program test_fib
use fib_mod, only: fib
implicit none
print*,"fib(6) =",fib(6) ! 8
end program test_fib
```
