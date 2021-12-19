! Demonstrate built-in arithmetic operators
program operators
implicit none
print*,2 + 3 ! 5
print*,2 - 3 ! -1
print*,2 * 3 ! 6
print*,2 / 3 ! 0 -- quotient truncated to integer
print*,2 / 3.0, 2.0/3 ! 0.666666687 0.666666687 -- int/real or real/int gives real
print*,2 ** 3 ! 8 -- ** is exponentiation, as in Python
end program operators