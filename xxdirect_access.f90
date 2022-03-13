module chemistry_mod
implicit none
integer, parameter :: atom_recl = 100
type :: atom_t
   character :: symbol*2, name*10
   real      :: mass
end type atom_t
end module chemistry_mod
!
program direct_access
use chemistry_mod, only: atom_t, atom_recl
implicit none
integer, parameter :: outu = 10, inu = 11, irec(*) = [4,1,10,2]
character (len=*), parameter :: data_file = "atomic_mass.dat"
integer :: i,j,ierr
type(atom_t) :: atom
! write to a direct access data file
open (unit=outu,file=data_file,access="direct",recl=atom_recl,action="write")
write (outu,rec=1) atom_t("H" ,"Hydrogen" ,1.007)
write (outu,rec=2) atom_t("He","Helium"   ,4.002)
write (outu,rec=3) atom_t("Li","Lithium"  ,6.941)
write (outu,rec=4) atom_t("Be","Beryllium",9.012)
close (outu)
! open the direct access data file for reading -- must specify recl
open (unit=inu,file=data_file,access="direct",recl=atom_recl,action="read")
do i=1,size(irec)
   j = irec(i) ! which record to read
   read (inu,rec=j,iostat=ierr) atom ! try to read record j from data file
   if (ierr == 0) then
      write (*,"(a2,1x,a10,1x,f8.4)") atom ! if it exists, print it
   else
      write (*,"('could not read record ',i0)") j
   end if
end do
end program direct_access