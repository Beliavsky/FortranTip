program deferred_character
implicit none
character (len=:), allocatable :: s
! s is a scalar deferred-length (DL) character variable
character (len=:), allocatable :: t(:)
! t is allocatable array of DL character variables
character (len=10)             :: text
text = "abcdef"
s = "one" ! takes len from RHS
print*,len(s) ! 3
s = "five" ! len can be changed
print*,len(s) ! 4
! reading a deferred-length character leaves size unchanged
read (text,"(a)") s 
print*,"'" // trim(s) // "'",len(s) ! 'abcd' 4
t = ["one ","five"]
print*,len(t),size(t) ! 4 2
t = ["one  ","three","five "] ! can change len and size
print*,len(t),size(t) ! 5 3
t(1) = "one" ! setting one element does not change len or size
print*,len(t),size(t) ! 5 3
end program deferred_character