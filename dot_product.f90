implicit none ! GitHub FortranTip dot_product.f90
integer, parameter :: n = 2
real :: x(n), y(n)
complex :: z(n)
x = [3.0,  5.0]
y = [4.0, 12.0]
z%re = x
z%im = y
print*,dot_product(x,y) ! 72.0
print*,sum(x*y)         ! 72.0
print*,z*conjg(z)       ! (25.0,0.0) (169.0,0.0)
print*,dot_product(z,z) ! (194.0,0.0)
print*,z*z              ! (-7.0,24.0) (-119.0,120.0)
print*,sum(z*z)         ! (-126.0,144.0)
end
