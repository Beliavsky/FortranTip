module m ! GitHub FortranTip derived_type_section.f90
implicit none
type :: v
   integer :: c(2) = [2,4], d = 6
end type v
end module m
!
program main
use m, only: v
implicit none
character (len=20) :: fmt="(*(1x,i0))"
type(v) :: t(3)
print fmt,t(1:2) ! 2 4 6 2 4 6
print fmt,t(1:2)%d ! 6 6
print fmt,t ! 2 4 6 2 4 6 2 4 6
print fmt,t%c(1) ! 2 2 2
! print fmt,t%c ! invalid: gfortran complains about
! two or more part references with nonzero rank
end program main