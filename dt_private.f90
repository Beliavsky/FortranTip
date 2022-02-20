module dt_mod
implicit none
character (len=*), parameter :: fmt="(a25,*(f4.1))"
!
type t1 ! b is public, c is private
! without a private statement,
! only the components declared private are private   
   real :: b
   real, private :: c
end type t1
!
type t2 ! b is private, c is public
   private
! because of the private statement, 
! only components declared public are public
   real :: b = 5.0 ! initializer
   real, public :: c
end type
!
contains
!
elemental subroutine set_t1_c(dt,c)
type(t1), intent(in out) :: dt
real    , intent(in)     :: c
dt%c = c
end subroutine set_t1_c
!
subroutine disp_t1(dt)
type(t1), intent(in) :: dt
print fmt,"in disp_t1, dt%b, dt%c = ",dt%b,dt%c
end subroutine disp_t1
!
subroutine disp_t2(dt)
type(t2), intent(in) :: dt
print fmt,"in disp_t2, dt%b, dt%c = ",dt%b,dt%c
end subroutine disp_t2
!
end module dt_mod
!
program test_dt
use dt_mod
implicit none
type(t1) :: x1
type(t2) :: x2
x1%b = 1.0
! x1%c = 1.0 ! invalid since x1%c is private
x2%c = 4.0
! x2%b = 1.0 ! invalid since x2%b is private
! since component c of type t1 is private,
! it must be set by a procedure in module dt_mod
call set_t1_c(x1,c=2.0)
! print*,"x1, x2 =",x1,x2 ! invalid, since list-directed
! output cannot be used for derived types with private
! components. 
call disp_t1(x1)
call disp_t2(x2)
! x1 = t1(5.0) ! invalid since component c of
! type(t1) has no intializer
x2 = t2(c=6.0) ! valid since since component b of
! type(t2) has an initializer
call disp_t2(x2)
end program test_dt
! output:
! in disp_t1, dt%b, dt%c =  1.0 2.0
! in disp_t2, dt%b, dt%c =  5.0 4.0
! in disp_t2, dt%b, dt%c =  5.0 6.0
