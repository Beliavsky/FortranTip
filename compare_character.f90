program compare_character_variables
implicit none
character (len=4), allocatable :: w(:)
w = ["John","Joan","girl","boy "]
print*,findloc(w,"girl"),findloc(w,"abcd") ! 3 0
write (*,"(*(g0,:,1x))") minval(w),minval(w(3:)) ! Joan boy
write (*,"(*(g0,:,1x))") minloc(w),minloc(w,mask=[0,0,1,1] == 1)
print*," " < "*", "*" < "0", "0" < "1", "9" < "A", &
       "Z" < "a", "a" < "b"
! replacing < with .lt. in the line above gives same result
print*,llt(" ","*"),llt("*","0"),llt("0","1"),llt("9","A"), &
       llt("Z","a"),llt("a","b") ! same result
! ASCII collating sequence is blanks, special characters, 
! numerals, upper case letters, lower case letters
end program compare_character_variables
! output:
! 3 0
! Joan boy  
! 2 4
!  T T T T T T
!  T T T T T T
