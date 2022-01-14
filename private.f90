module stats_mod
implicit none
private
public :: mean
interface mean
   module procedure mean_int, mean_real
end interface mean
contains
pure function mean_int(vec) result(avg)
integer, intent(in) :: vec(:)
real                :: avg
avg = real(sum(vec))/(max(1,size(vec)))
! handles the case of size(vec) = 0
end function mean_int
!
pure function mean_real(vec) result(avg)
real, intent(in)    :: vec(:)
real                :: avg
avg = sum(vec)/(max(1,size(vec)))
end function mean_real
!
end module stats_mod
!
program test_stats
use stats_mod ! import mean, the only PUBLIC entity
implicit none
print*,mean([4,7]),mean([4.0,7.0])
! line below invalid because mean_int PRIVATE
! print*,mean_int([4,7]) 
end program test_stats