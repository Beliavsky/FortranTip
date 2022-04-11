module m ! alloc_dt.f90 on GitHub FortranTip
implicit none
type :: data_frame
   character (len=20)              :: title
   character (len=20), allocatable :: colnames(:) ! (ncol)
   real              , allocatable :: x(:,:)      ! (nobs,ncol)
end type data_frame
contains
!
subroutine dealloc(dt) ! deallocate allocatable components of dt
type(data_frame), intent(out) :: dt
end subroutine dealloc
!
end module m
!
program main
use m, only: data_frame, dealloc
implicit none
type(data_frame), allocatable :: dt_alloc ! allocatable scalar
type(data_frame)              :: dt       ! regular scalar
integer, parameter            :: nobs = 100, ncol = 3
allocate (dt_alloc)
allocate (dt_alloc%colnames(ncol), dt_alloc%x(nobs,ncol), &
   dt%colnames(ncol), dt%x(nobs,ncol))
print*,allocated(dt_alloc), allocated(dt_alloc%colnames), &
   allocated(dt_alloc%x),allocated(dt%colnames),allocated(dt%x)
deallocate (dt_alloc) ! also deallocates allocatable components
! A derived type that is not allocatable can be passed
! to an intent(out) dummy argument to deallocate its components
call dealloc(dt) 
print*,allocated(dt_alloc),allocated(dt%colnames),allocated(dt%x)
print*,len(dt%title) ! 20, since data_frame%title not allocatable
end program main
! output:
!  T T T T T
!  F F F
! 20
