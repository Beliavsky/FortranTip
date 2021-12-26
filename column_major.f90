program column_major
  integer :: nd_array(10000,10000)
  integer :: i, j

  ! FASTER: Looping consecutively through columns
  do j=1, size(nd_array, dim=2)
    do i=1, size(nd_array, dim=1)
      ! Do some stuff with nd_array(i,j)
     end do
  end do

  ! SLOWER: Looping consecutively through rows
  do i=1, size(nd_array, dim=1)
    do j=1, size(nd_array, dim=2)
      ! Do some stuff with nd_array(i,j)
    end do
  end do
end program
