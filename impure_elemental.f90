module m
implicit none
contains
impure elemental subroutine print_pow(i,pow)
integer, intent(in) :: i, pow
print "(i0,'^',i0,' = ',i0)",i, pow, i**pow
end subroutine print_pow
end module m
!
program main
use m, only: print_pow
call print_pow(i=[1,3,5], pow=3) ; print*
call print_pow(i=2, pow=[1,2,3]) ; print*
call print_pow(i=[2,3], pow=[4,5])
end program main
! output:
! 1^3 = 1
! 3^3 = 27
! 5^3 = 125
!
! 2^1 = 2
! 2^2 = 4
! 2^3 = 8
!
! 2^4 = 16
! 3^5 = 243