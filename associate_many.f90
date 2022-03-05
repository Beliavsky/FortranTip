program test_associate
implicit none
integer :: i
associate (a => 2.0, b => 2.0, c => -12.0) ! 2*x^2 + 2*x - 12 = 0
associate (discrim => b**2 - 4*a*c, denom => 2*a)
if (discrim < 0.0 .or. a == 0.0) stop "need discrim >= 0 and a /= 0.0"
! because r1, r2 depend on discrim and denom, they need a separate ASSOCIATE
associate (r1 => (-b + sqrt(discrim))/denom, r2 => (-b - sqrt(discrim))/denom)
print*,"coefficients =",a,b,c
print*,"roots =",r1,r2 ! 2.00000000 -3.00000000
end associate ; end associate ; end associate
pow: associate (powers => [0.5,0.33,0.25]) ! ASSOCIATE block can be named
print "(/,a8,*(f8.4))","power",powers
do i=2,4
   associate (x => real(i))
   print "(i8,*(f8.4))",i,x**powers
   end associate ! matching END ASSOCIATE needed for ASSOCIATE in loop
end do
end associate pow ! If ASSOCIATE named, END ASSOCIATE must have matching name
end program test_associate
! output:
!  coefficients =   2.00000000       2.00000000      -12.0000000    
!  roots =   2.00000000      -3.00000000    
! 
!    power  0.5000  0.3300  0.2500
!        2  1.4142  1.2570  1.1892
!        3  1.7321  1.4370  1.3161
!        4  2.0000  1.5801  1.4142
