program test_iany
implicit none
integer, parameter :: vm_read = int(Z'0010')
integer, parameter :: vm_write = int(Z'0020')
integer, parameter :: dup_handle = int(Z'0040')
integer, parameter :: create_process = int(Z'0080')
print "(z8.8)",ior(vm_read,ior(vm_write,ior(dup_handle,create_process)))
print "(z8.8)",iany([vm_read,vm_write,dup_handle,create_process])
end program test_iany
! output:
! 000000F0
! 000000F0