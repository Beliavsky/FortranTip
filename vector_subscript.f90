module m
implicit none
contains
!
subroutine disp_vec(v,title)
integer, intent(in) :: v(:)
character (len=*), intent(in) :: title
write (*,"(a)") title // " ="
write (*,"(*(i4))") v
write (*,*)
end subroutine disp_vec
!
subroutine disp_mat(m,title)
integer, intent(in) :: m(:,:)
character (len=*), intent(in) :: title
integer :: i1
write (*,"(a)") title // " ="
do i1=1,size(m,1)
   write (*,"(*(i4))") m(i1,:)
end do
write (*,*)
end subroutine disp_mat
!
pure subroutine twice(m)
integer, intent(in out) :: m(:,:)
m = 2*m
end subroutine twice
!
end module m
!
program vector_subscript ! analog to Numpy "fancy indexing"
use m, only: twice, disp_vec, disp_mat
implicit none
integer, parameter :: n1 = 3, n2 = 4
integer :: mat(n1,n2), vec(n2), i1, i2
forall (i1=1:n1,i2=1:n2) mat(i1,i2) = 10*i1 + i2
vec = mat(1,:)
call disp_vec(vec,"vec")
call disp_vec(vec([1,3]),"vec([1,3])")
call disp_mat(mat,"mat")
call disp_mat(mat([1,3],:),"mat([1,3],:)")
! Vector subscripts in multiple dimensions yield a 
! tensor product. 
call disp_mat(mat([1,3],[2,4]),"mat([1,3],[2,4])")
call twice(mat)
! line below invalid because intent(in out) dummy argument
! has actual argument with vector subscript
! call twice(mat([1],:)) 
end program vector_subscript
! output:
! vec =
!   11  12  13  14
! 
! vec([1,3]) =
!   11  13
! 
! mat =
!   11  12  13  14
!   21  22  23  24
!   31  32  33  34
! 
! mat([1,3],:) =
!   11  12  13  14
!   31  32  33  34
! 
! mat([1,3],[2,4]) =
!   12  14
!   32  34
