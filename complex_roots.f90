implicit none ! complex_roots.f90 at GitHub FortranTip
integer, parameter :: nroots = 4
complex :: z, root, root1
real :: theta, theta_root1, theta_root, abs_z, abs_root
integer :: i
real, parameter :: pi = 4*atan(1.0), power=1.0/nroots
character (len=*), parameter :: fmt_cr = "(a8, 2f14.4)"
z = (0.0, 16.0)           ! z = 0 + 16i
theta = atan2(z%im, z%re) ! angle of z in polar form
abs_z = abs(z)
print fmt_cr, "power", power
print fmt_cr, "z", z
print fmt_cr, "theta/pi", theta/pi
root1 = z ** power
abs_root = abs_z ** power
theta_root1 = atan2(root1%im, root1%re)
print fmt_cr, "|z|", abs_z
print "(/,a8, *(a14))", "i", "theta_root/pi", "real(root)", "imag(root)", &
                      "real(root^4)", "imag(root^4)"
do i=1,nroots
   theta_root = theta_root1 + 2*(i-1)*pi/nroots
   root = abs_root * cmplx(cos(theta_root), sin(theta_root))
   print "(i8, *(f14.4))", i, theta_root/pi, root, root**nroots
end do
end
! output:
!        z        0.0000       16.0000
! theta/pi        0.5000
!     root        1.8478        0.7654
!      |z|       16.0000
!   |root|        2.0000
! 
!        i theta_root/pi    real(root)    imag(root)  real(root^4)  imag(root^4)
!        1        0.1250        1.8478        0.7654       -0.0000       16.0000
!        2        0.6250       -0.7654        1.8478       -0.0000       16.0000
!        3        1.1250       -1.8478       -0.7654        0.0000       16.0000
!        4        1.6250        0.7654       -1.8478       -0.0000       16.0000