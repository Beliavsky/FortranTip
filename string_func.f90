program intrinsic_string_functions
implicit none
character (len=*), parameter :: num = "0123456789"
! SCAN, VERIFY, INDEX, and LEN_TRIM are elemental
! scan(x,y) returns first position of x found in y
print*,scan(["2022-Jan","abcdefgh"],num) ! 1 0
print*,scan("2022-Jan",num,back=.true.) ! 4 -- counting from the back
! verify(x,y) returns first position in x NOT found in y
print*,verify(string=["13579","18Dec"],set=num) ! 0 3
! index(x,y) returns first position of substring y in x 
print*,index(num,substring=["34","35"]) ! 4 0
! adjustl/adjustr remove leading/trailing spaces and pad to preserve LEN
! in format string, note that '''' prints single apostrophe
print "(*(:,'''',a,''' '))", adjustl(" abc"),adjustr("abc ") 
! 'abc ' ' abc'
print*,len_trim(["abc "," abc"]) ! 3 4
! LEN function is not elemental, and elements of character 
! array have the same len
print*,len(["abc "," abc"]) ! 4
end program intrinsic_string_functions
