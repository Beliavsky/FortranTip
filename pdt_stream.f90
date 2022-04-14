module m ! parameterized derived type analog of dt_stream.f90
implicit none
integer, parameter :: nlen = 10
type :: data_frame(n1,n2)
   integer, len         :: n1,n2
   character (len=nlen) :: col_names(n2)
   real                 :: x(n1,n2)     
end type data_frame
contains
subroutine write_stream(df,iu)
type(data_frame(*,*)), intent(in) :: df
integer              , intent(in) :: iu
! write dimensions of df components followed by values
write (iu) df%n1,df%n2,df%col_names,df%x
end subroutine write_stream
!
subroutine read_stream(df,iu)
type(data_frame(:,:)), intent(out), allocatable :: df
integer              , intent(in)  :: iu
integer                            :: n1,n2
read (iu) n1,n2 ! read dimensions of df%x
allocate (data_frame(n1,n2) :: df)
read (iu) df%col_names,df%x ! read df
end subroutine read_stream
!
end module m
!
program main
use m, only: data_frame, write_stream, read_stream
implicit none
integer, parameter :: n1 = 10**7, n2 = 2
type(data_frame(:,:)), allocatable :: df_in,df_out
character (len=*), parameter :: fname = "temp.bin"
integer :: iu
allocate (data_frame(n1,n2) :: df_in)
df_in%col_names = ["x1","x2"]
call random_number(df_in%x)
open (unit=iu,file=fname,form="unformatted",access="stream")
call write_stream(df_in,iu) ! write dimensions and values of df_in
rewind (iu)
call read_stream(df_out,iu) ! read df_out and check it
print*,minval(df_in%x),maxval(df_in%x),all(df_in%x == df_out%x), &
       all(df_in%col_names==df_out%col_names)
end program main
! sample output:
!    1.78813934E-07  0.999999940     T T
