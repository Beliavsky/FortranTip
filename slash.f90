program slash_descriptor
implicit none
character :: text*100, word*10
print "('cat'/'dog')"
print "(a)","cat" // new_line("") // "dog"
text = "3/20/2022"
read (text,*) word ! stops at '3' because / follows
print "(a)","word = '" // trim(word) // "'"
end program slash_descriptor
! output
! cat
! dog
! cat
! dog
! word = '3'
