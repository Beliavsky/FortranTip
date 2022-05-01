program boz ! GitHub FortranTip boz.f90
implicit none
character (len=20) :: fmt="(*(1x,i0))"
print fmt, int(B'0'),int(B'1'),int(B'10'),int(B'11') ! 0 1 2 3
print "(4(1x,B0))",0, 1, 2, 3 ! 0 1 10 11
print fmt, int(O'0'),int(O'10'),int(O'17') ! 0 8 15
print "(3(1x,O0))",0, 8, 15 ! 0 10 17
print fmt, int(Z'10'),int(Z'1A'),int(Z'1F') ! 16 26 31
print "(3(1x,Z0))",16, 26, 31 ! 10 1A 1F
print fmt,transfer(real(Z'1F'),0) ! 31
end program boz