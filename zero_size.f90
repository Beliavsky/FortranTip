program zero_size
implicit none
associate (r0 => [real ::], d0 => [real(kind(1.0d0)) ::], &
           i0 => [integer ::], c20 => [character (len=2) ::], &
           c50 => [character (len=5) ::])
print*,size(r0),kind(r0)  ! 0 4 
print*,size(d0),kind(d0)  ! 0 8
print*,size(i0),kind(i0)  ! 0 4
print*,size(c20),len(c20) ! 0 2
print*,size(c50),len(c50) ! 0 5
end associate
end program zero_size
