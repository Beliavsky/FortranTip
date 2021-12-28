program bitwise
implicit none
print*,iand(1,1),iand(1,0),iand(0,1),iand(0,0) ! 1 0 0 0
print*,iand(2,2),iand(2,1),iand(2,0)           ! 2 0 0
print*,ior(1,1),ior(1,0),ior(0,1),ior(0,0)     ! 1 1 1 0
print*,ieor(1,1),ieor(1,0),ieor(0,1),ieor(0,0) ! 0 1 1 0
print*,iany([1,1]),iany([1,0]),iany([0,0])     ! 1 1 0
end program bitwise
