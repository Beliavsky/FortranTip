module iostat_mod
use iso_fortran_env, only: iostat_eor, iostat_end
implicit none
contains
!
subroutine print_iostat_meaning(iostat)
integer, intent(in) :: iostat
character (len=*), parameter :: fmt = "(a,/)"
select case (iostat)
   case (iostat_eor); print fmt,"iostat indicates end of record"
   case (iostat_end); print fmt,"iostat indicates end of file"
end select
end subroutine print_iostat_meaning
!
pure function quote(text) result(quoted_text)
character (len=*), intent(in)  :: text
character (len=:), allocatable :: quoted_text
quoted_text = "'" // trim(text) // "'"
end function quote
end module iostat_mod

program test_iomsg
use iostat_mod, only: print_iostat_meaning,quote
implicit none
character (len=*), parameter :: infile = "iomsg_data_file.txt"
integer          , parameter :: nv = 2
integer                      :: iu,vec(nv),ierr_text,ierr_vec
character (len=100)          :: text,msg_text,msg_vec
open (newunit=iu,file=infile,action="read",status="old")
! contents of infile (without "! "):
! 10 20
! 11
! dog cat
! 4 cat
! 12 22
do ! loop over lines of data file
   msg_text = "" ! will be unchanged if no error occurs
   read (iu,"(a)",iomsg=msg_text,iostat=ierr_text) text
   if (ierr_text /= 0) then ! end of file: exit loop
      print* ; call print_iostat_meaning(ierr_text)
      exit
   end if
   msg_vec = ""
   read (text,*,iomsg=msg_vec,iostat=ierr_vec) vec ! read integers from text
   if (ierr_vec /= 0) then
      write (*,"(/,'could not read ',i0,' integers from ',a)") nv,quote(text)
      write (*,"(a)") "iomsg = " // quote(msg_vec) ! differs by compiler
      call print_iostat_meaning(ierr_text)
      msg_vec = ""
   else
      write (*,"(/,'read',2(1x,i0),' from ',a)") vec(1),vec(2),quote(text)
   end if
end do
if (msg_text /= "") write (*,"(a)") "iomsg = " // quote(msg_text)
end program test_iomsg
! gfortran output:
! read 10 20 from '10 20'
! 
! could not read 2 integers from '11'
! iomsg = 'End of file'
! 
! could not read 2 integers from 'dog cat'
! iomsg = 'Bad integer for item 1 in list input'
! 
! could not read 2 integers from '4 cat'
! iomsg = 'Bad integer for item 2 in list input'
! 
! read 12 22 from '12 22'
! 
! iostat indicates end of file
! 
! iomsg = 'End of file'
!
! Intel Fortran output (note that iomsg differs):
! read 10 20 from '10 20'
! 
! could not read 2 integers from '11'
! iomsg = 'end-of-file during read, unit -5, file Internal List-Directed Read'
! 
! could not read 2 integers from 'dog cat'
! iomsg = 'list-directed I/O syntax error, unit -5, file Internal List-Directed Read'
! 
! could not read 2 integers from '4 cat'
! iomsg = 'list-directed I/O syntax error, unit -5, file Internal List-Directed Read'
! 
! read 12 22 from '12 22'
!  
! iostat indicates end of file
! 
! iomsg = 'end-of-file during read, unit -129, file c:\fortran\tweets\unposted\iomsg_data_file.txt'