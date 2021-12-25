program test_cmplx
implicit none
print*,kind(cmplx(1.0d0,1.0d0)) ! 4 -- likely unintended!
print*,kind(cmplx(1.0d0,1.0d0,kind=kind(1.0d0))) ! 8
end program test_cmplx

