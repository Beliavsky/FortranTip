integer, parameter :: dp = kind(1.0d0)
integer, parameter :: n = 10**7
real(kind=dp)      :: x(n), xchk(n)
integer            :: iu
call random_number(x)
open (newunit=iu, file="temp.bin", form="unformatted", &
      access="stream")
write (iu) x
rewind (iu)
read (iu) xchk
print*,maxval(abs(x-xchk)) ! 0.0000000000000000
end
