program test_array_equality
implicit none
integer, parameter :: n = 3, a(n)=[1,2,3], &
   b(n)=[1,2,3], c(n) = [1,2,4]
logical :: ab_equal
write(*,*) a == b ! This returns an array, T T T
! Below does not work since A==B is an array 
! if (A == B) write(*,*) "A and B are equal" 
print*,all(a == b), all(a == b+1) ! T F
print*,all(a == c), any(a == c)   ! F T
! How to test if two arrays are equal using a loop
compare: block
integer :: i ! exists only within block
ab_equal = .false.
if (size(a) == size(b)) then
   do i=1,size(a)
      ab_equal = a(i) == b(i)
      if (.not. ab_equal) exit
   end do
end if
end block compare
print*,"a same as b?",ab_equal,equal(a,b)
!
contains
! function to test equality of 1D arrays
! unlike the expression all(m == n) it can be used
! when size(m) /= size(n)
pure function equal(m,n) result(tf)
integer, intent(in) :: m(:),n(:)
logical             :: tf
integer             :: i
tf = .false.
if (size(m) /= size(n)) return
do i=1,size(m)
   if (m(i) /= n(i)) return
end do
tf = .true.
end function equal
!
end program test_array_equality