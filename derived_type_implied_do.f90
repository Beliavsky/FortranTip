module m ! GitHub FortranTip derived_type_implied_do.f90
implicit none
character (len=*), parameter :: fmt="(*(1x,i0))"
integer, parameter :: size_c = 2
type :: v
   integer :: c(size_c) = [2,4], d = 6
end type v
end module m
!
program derived_type_section
use m, only: v, size_c, fmt
implicit none
type(v) :: t(2)
integer :: i,j
! print fmt,t%c ! invalid: gfortran complains about
! two or more part references with nonzero rank
print fmt,(t(i)%c,i=1,size(t)) ! 2 4 2 4
print fmt,((t(i)%c(j),i=1,size(t)),j=1,size_c) ! 2 2 4 4
end program derived_type_section