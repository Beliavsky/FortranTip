implicit none ! GitHub FortranTip trigd.f90
integer, parameter :: dp = kind(1.0d0)
print*,sind(90.0_dp), cosd(90.0_dp), tand(45.0_dp)
print*,asind(1.0_dp), acosd(0.0_dp), atand(1.0_dp)
end
! output (with fewer zeros):
! 1.0 0.0 1.0
! 90.0 90.0 45.0
