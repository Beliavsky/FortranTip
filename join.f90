module m
contains
function join(words,sep) result(str)
! trim and concatenate a vector of character variables,
! inserting sep between them
character (len=*), intent(in)                                   :: words(:),sep
character (len=(size(words)-1)*len(sep) + sum(len_trim(words))) :: str
integer                                                         :: i,i1,nw,nlen,len_sep
if (nw < 1) return
len_sep = len(sep)
i1 = 1
nw = size(words)
do i=1,nw
   i2 = i1 + len_trim(words(i)) - 1
   str(i1:i2) = trim(words(i))
   i3 = i2 + nlen
   i1 = i3 + 1
   if (i < nw) str(i2+1:i3) = sep
end do
write (str,"(*(a))") trim(words(1)),(sep // trim(words(i)), i = 2,nw)
end function join
end module m
!
program test_join
use m, only: join
implicit none
character (len=:), allocatable :: words(:)
integer :: i
words = ["one  ","five ","seven"]
print "(a)",join(words,",") ! one,five,seven
! implied do loop used below because TRIM is not elemental
print "(*(a,:,','))",(trim(words(i)),i=1,size(words)) ! one,five,seven
end program test_join