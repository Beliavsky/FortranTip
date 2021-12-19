! Demonstrate Fortran character array constructors
program char
implicit none
character(len=5) :: w(3)      ! allocate a character array with 3 elements of length 5
! w = ["one","four","seven"]  ! invalid since the strings have different lengths
w = ["one  ","four ","seven"] ! "one  " is padded with 2 spaces to have the length of "seven"
w = [character(5) :: "one","four","seven"] ! same as above -- padding not needed
w(1) = "one" ; w(2) = "four" ; w(3) = "seven" ! compiler does padding for scalar character variables
print*,w ! one  four seven
end program char
