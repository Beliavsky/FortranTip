program test_do_while
implicit none
integer :: i = 1, factorial = 1
print "(2a10)","i","factorial"
do while (factorial <= 100)
   ! print factorials up to 100
   print "(2i10)",i,factorial
   i = i + 1
   factorial = factorial * i
end do
i = 1
factorial = 1
print "(/,2a10)","i","factorial"
do ! infinite loop with exit
   print "(2i10)",i,factorial
   i = i + 1
   factorial = factorial * i
   if (factorial > 100) exit
end do
end program test_do_while
! output:
!          i factorial
!          1         1
!          2         2
!          3         6
!          4        24
!
!          i factorial
!          1         1
!          2         2
!          3         6
!          4        24