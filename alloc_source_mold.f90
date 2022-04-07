program alloc
implicit none
integer, parameter :: n = 2
real :: x(n)
real, allocatable :: y(:)
print*,"n =",n
call random_number(x)
print*,"x =",x
allocate (y(n)) ; print "(a)","allocate (y(n))"
print*,"y =",y ! undefined
deallocate (y) ! if allocated, must deallocate before allocate
allocate (y(n),source=2.0) ! source must be scalar of have size n
print "(a)","allocate (y(n),source=2.0)"
print*,"y =",y
deallocate (y)
allocate (y(n),source=[3.0,4.0])
print "(a)","allocate (y(n),source=[3.0,4.0])"
print*,"y =",y
deallocate (y) 
allocate (y,mold=x) ;  print "(a)","allocate (y,mold=x)"
print*,"y =",y ! undefined
deallocate (y)
allocate (y,source=x) ; print "(a)","allocate (y,source=x)"
print*,"y =",y ! y equals x
y = [-1.0,x] ! valid even if y is allocated
print "(a)","y = [-1.0,x]"
print*,"y =",y
associate (z => 2*x) ! allocates z to size(x), fills with 2*x
print "(a)","associate (z => 10*x)"
print*,"z =",z
end associate
end program alloc
! sample output:
!  n =           2
!  x =  0.880050063      0.891854525    
! 
! allocate (y(n))
!  y =   2.37091988E+36   7.53898574E-43
! 
! allocate (y(n),source=2.0)
!  y =   2.00000000       2.00000000    
! 
! allocate (y(n),source=[3.0,4.0])
!  y =   3.00000000       4.00000000    
! 
! allocate (y,mold=x)
!  y =   2.37080579E+36   7.53898574E-43
! 
! allocate (y,source=x)
!  y =  0.880050063      0.891854525    
! 
! y = [-1.0,x]
!  y =  -1.00000000      0.880050063      0.891854525    
! 
! associate (z => 10*x)
!  z =   1.76010013       1.78370905    