program substring ! substrings of character variable arrays
implicit none
character (len=4) :: words(3)
character (len=*), parameter :: fmt = "(*(a,:,1x))"
words(1) = "ABCD"
words(2) = "abcd"
words(3) = "1234"
print fmt,words(1:2)      ! ABCD abcd -- words 1 and 2
print fmt,words(1:2)(:)   ! ABCD abcd -- same
print fmt,words(2)(2:3)   ! bc        -- positions 2:3 of word 2
print fmt,words(1:2)(2:3) ! BC bc     -- positions 2:3 of words 1:2
print fmt,words(:)(2:3)   ! BC bc 23  -- positions 2:3 of all words
end program substring
