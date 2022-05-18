program main ! GitHub FortranTip leak.f90
implicit none
integer :: i
real, pointer :: p(:)
do i=1,2
   p => ran(5)
   print*,p
   ! line below commented out to produce memory leak
   ! deallocate (p)
end do
contains
function ran(n) result(p)
integer, intent(in) :: n
real, pointer :: p(:) ! better to return allocatable
allocate (p(n))
call random_number(p)
end function ran
end program main
! On WSL2, gfortran leak.f90 && valgrind ./a.out says
! ==3128== LEAK SUMMARY:
! ==3128==    definitely lost: 40 bytes in 2 blocks
