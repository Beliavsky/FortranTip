! pack selects elements
program count_pack
implicit none
integer :: v(3) = [1,-4,9]
print*,pack(v,v>0) ! 1 9 -- keep values > 0
print*,count(v>0)  ! 2   -- count values > 0
print*,size(v)     ! 3
print*,sum(v)      ! 6
print*,sum(v,v>0)  ! 10  -- sum has optional mask argument
print*,sum(pack(v,v>0)) ! 10
end program count_pack

