program im_re
integer, parameter :: wp = kind(1.0)
complex(kind=wp)   :: z,v(2)
z = (3.0_wp,4.0_wp)  ! set real and imaginary parts
z = cmplx(3.0_wp,4.0_wp,kind=wp) ! same as above
print*,z%re,real(z)  ! 3.000000 3.000000
print*,z%im,aimag(z) ! 4.000000 4.000000 
print*,abs(z)        ! 5.000000
print*,conjg(z)      ! (3.000000,-4.000000) complex conjugate
print*,aimag(2*z)    ! 8.000000
! line below not allowed: %re and %im do not apply to expressions
! print*,(2*z)%im 
z%re = 1.0_wp ! set real part of z
z%im = 5.0_wp ! set imaginary part of z
print*,z ! (1.000000,5.000000)
v = [z,2*z]
print*,v ! (1.00000000,5.00000000) (2.00000000,10.0000000)
v%re = 0.0_wp ! set real part of complex array to scalar
! set imaginary part of complex array to array of same shape
v%im = [0.1_wp,0.2_wp] 
print*,v ! (0.0000000E+00,0.1000000) (0.0000000E+00,0.2000000)
end program im_re
