module join_mod
implicit none
contains
pure function join(words,sep) result(text)
! trim and join words with separator sep
character (len=*), intent(in) :: words(:)
character (len=*), intent(in) :: sep
character (sum(len_trim(words)) + & ! len_trim is elemental
          (size(words)-1)*len(sep)) :: text
integer :: i,n
n = size(words)
write (text,"(*(a))") (trim(words(i)),sep,i=1,n-1), &
                       trim(words(n))
end function join
end module join_mod
!
program trim_loop
use join_mod, only: join
implicit none
integer              :: i
integer, parameter   :: nelem = 3, nlen = 10
character (len=nlen) :: elem(nelem) = &
   [character (len=nlen) :: "Hydrogen", "Helium", "Lithium"]
print "(a,i0,a,*(1x,a,:,','))","The first ",nelem," elements by " // &
      "atomic # are",elem ! trailing spaces in elem are printed
print "(a,i0,a,*(1x,a,:,','))","The first ",nelem," elements by " // &
      "atomic # are",(trim(elem(i)),i=1,nelem)
print "(a,i0,a,1x,a)","The first ",nelem," elements by " // &
      "atomic # are",join(elem,", ") // "."
! "atomic # are",trim(elem) ! invalid since TRIM not elemental
end program trim_loop
! output:
! The first 3 elements by atomic # are Hydrogen  , Helium    , Lithium   
! The first 3 elements by atomic # are Hydrogen, Helium, Lithium
! The first 3 elements by atomic # are Hydrogen, Helium, Lithium.
