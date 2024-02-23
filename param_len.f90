! GitHub FortranTip param_len.f90
implicit none
character (len=*), parameter :: b="boy", g="girl"
integer, parameter :: v(*) = [2, 4], w(0:*) = v
print*,len(b), len(g), size(v), size(w) ! 3 4 2 2
print*,ubound(v), ubound(w) ! 2 1
end
