! "A select case construct conditionally executes one block of
! constructs or statements depending on the value of a scalar expression
! in a select case statement." https://riptutorial.com/fortran/example/5584/select-case-construct
! Select case is more restrictive and clear than an if block and should be used when it
! is possible, especially when there are many branches.
! Note that the a semicolon is used to place several statements on a line.
program select_case
implicit none
integer :: i
character (len=10) :: rating
do i=0,5
   select case(i)
      case(1:2)    ; rating = "bad"
      case(3)      ; rating = "medium"
      case(4:)     ; rating = "good"
      case default ; rating = "???"
   end select
   print*,i,trim(rating)
end do
end program select_case
! output:
