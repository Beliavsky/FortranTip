implicit none ! GitHub FortranTip print_implied_do_loop.f90
integer, parameter :: n=2
integer :: i, i1, i2, i3, m(n,n,n), v(n), v10(n)
forall (i1=1:n, i2=1:n, i3=1:n) m(i1, i2, i3) = &
   i1 + 10*i2 + 100*i3
! print m in usual column major order
print "(*(1x,i0))", m
! same as above
print "(*(1x,i0))", (((m(i1,i2,i3),i1=1,n),i2=1,n),i3=1,n)
! print m with outer loop over 2nd index
print "(*(1x,i0))", (m(:,i2,:), i2=1,n)
forall (i=1:n) v(i) = i**2
v10 = 10*v
! interleave arrays v and v10
print "(*(1x,i0))",(v(i), v10(i), i=1,n)
end
! output:
! 111 112 121 122 211 212 221 222
! 111 112 121 122 211 212 221 222
! 111 112 211 212 121 122 221 222
! 1 10 4 40
