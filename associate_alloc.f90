program associate_alloc
implicit none
integer, allocatable :: v(:)
v = [3,4] ! must allocate v before associating c to it
associate (c => v) ; call disp("1",v,c)
c = c*10           ; call disp("2",v,c)
! line below is invalid -- v should not be reallocated while
! c is still ASSOCIATEd to it
v = [2]            ; call disp("3",v,c)
end associate
contains
subroutine disp(label,v,c)
character (len=*), intent(in) :: label
integer, intent(in) :: v(:),c(:)
write (*,"(a,' v = ',*(1x,i0))",advance="no") label,v
write (*,"(3x,'c = ',*(1x,i0))") c
end subroutine disp
end program associate_alloc
! gfortran output:
! 1 v =  3 4    c =  3 4
! 2 v =  30 40    c =  30 40
! 3 v =  2    c =  2 40
! Intel Fortran output:
! 1 v =  3 4    c =  3 4
! 2 v =  30 40    c =  30 40
! 3 v =  2    c =  30 40
! the output differs for the last line, which is invalid