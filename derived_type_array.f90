module m
type foo
   real :: a,b,c,d
end type foo
!
type foo_vec
   real, allocatable :: a(:),b(:),c(:),d(:)
end type foo_vec
end module m
!
program derived_type
use m, only: foo, foo_vec
type(foo), allocatable :: t(:)
type(foo_vec)          :: u
integer, parameter     :: n = 10**6
allocate (t(n)) ! array of derived types
! t(i)%a, t(i)%b, t(i)%c, t(i)%d is contiguous
allocate (u%a(n),u%b(n),u%c(n),u%d(n)) ! derived type with array components
! u%a(:) is contiguous, as is u%b(:) etc.
end program derived_type