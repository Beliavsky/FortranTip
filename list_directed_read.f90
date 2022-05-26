program main ! GitHub FortranTip list_directed_read.f90
implicit none
integer, parameter :: n = 6
integer            :: iter,v(n)
data v / 3*7, 8, 2*9 / ! set v to [7,7,7,8,9,9]
print "('v =',*(1x,i0))", v 
do iter=1,2
   print "(a,i0,a)", "enter ",n," values of v"
   read (*,*) v
   print "('v =',*(1x,i0))", v 
end do
end program main
! sample session:
! v = 7 7 7 8 9 9
! enter 6 values of v
! 3*,2*4/
! v = 7 7 7 4 4 9
! enter 6 values of v
! ,,5,6/
! v = 7 7 5 6 4 9
