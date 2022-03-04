program main
implicit none
integer, target :: v(4)
! target atribute required since v will be pointed to
integer, pointer :: p(:)
! pointer must declared to correct type and rank
v = [10,20,30,40]
p => v(2:3)
associate (w => v(2:3)) ! type of w is inferred
print*,"p =",p
print*,"w =",w
print*,"v =",v
p = p * 10
w = w * 10
! changes to p and w are transmitted to v(2:3)
print*
print*,"p =",p
print*,"w =",w
print*,"v =",v
end associate 
! each ASSOCIATE must be terminated with END ASSOCIATE
end program main