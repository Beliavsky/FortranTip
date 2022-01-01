!> The output and input are in the same line by using `advance="no"`, 
!> which is more beautiful and can save one line.
write (*, "(a)", advance="no") "Please input an Integer: "
read (*, *) i

!> Two lines.
write (*, "(a)") "Please input an Integer: "
read (*, *) i

end

! gfortran main.f90 && ./a
!
! Please input an Integer: 10
! Please input an Integer:
! 10
