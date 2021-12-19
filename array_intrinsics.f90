! Demonstrate array intrinsic functions
program array_intrinsics
integer, parameter :: vec(3) = [4,1,9]
print*,minval(vec),maxval(vec) ! output: 1 9
print*,sum(vec),product(vec) ! 14 36
print*,minloc(vec),maxloc(vec) ! 2 3
print*,findloc(vec,9),findloc(vec,8) ! 3 0
end program array_intrinsics
