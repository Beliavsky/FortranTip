implicit none ! GitHub FortranTip complex_print.f90
print "(f0.1,sp,f0.1,'i')", cmplx(2.1, -3.2) ! 2.1-3.2i
print "(f0.1,sp,f0.1,'i')", cmplx(2.1,  3.2) ! 2.1+3.2i
! without the sp descriptor the output can be bad:
print "(f0.1,f0.1,'i')", cmplx(2.1,  3.2) ! 2.13.2i
end
