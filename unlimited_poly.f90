program unlimited_polymorphic
implicit none
type :: date
   integer :: year, month, day
end type date
class(*), allocatable :: x ! unlimited polymorphic
real :: y
x = date(2022,2,17)
call disp(x)
x = "abc"
call disp(x)
x = 2.0 ! x has been assigned to 3 different types
! two lines below are invalid outside type guard
! y = x
! print*,"x=",x
select type(x)
   type is (real)
      ! two lines below are valid inside type guard
      y = 10*x
      print*,"x =",x
end select
print*,"y =",y
call disp(x) ! x can be used as actual argument
call set_real(x,y)
print*,"y =",y
x = 42
call disp(x)
call set_real(x,y)
contains
!
subroutine disp(x)
class(*), intent(in) :: x
! print*,"x =",x ! invalid for class(*) variable
select type (x)
   type is (date)
      print*,"x =",x," is date"
   type is (character (len=*))
      print*,"x = ",x," is character"
   type is (real)
      print*,"x =",x,"is real"
   type is (integer)
      print*,"x =",x,"is integer"
end select
end subroutine disp
!
subroutine set_real(x,y)
class(*), intent(in)  :: x
real    , intent(out) :: y
select type(x)
   type is (real)
      y = x
   class default
      error stop "need x real in set_real, STOPPING"
end select
end subroutine set_real
!
end program unlimited_polymorphic
! output:
!  x =        2022           2          17  is date
!  x = abc is character
!  x =   2.00000000    
!  y =   20.0000000    
!  x =   2.00000000     is real
!  y =   2.00000000    
!  x =          42 is integer
! ERROR STOP need x real in set_real, STOPPING
