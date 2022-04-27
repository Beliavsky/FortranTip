``` .f90
module fib_mod
implicit none
contains
elemental function fib(i) result(ifib)
integer, intent(in) :: i
integer             :: ifib,j,fib_old(2)
ifib = merge(0, 1, i<1)
if (i < 3) return
fib_old = [1,1]
do j=3,i
   ifib = fib_old(1) + fib_old(2)
   if (j == i) exit
   fib_old = [ifib,fib_old(1)]
end do
end function fib
end module fib_mod
!
program test_fib
use fib_mod, only: fib
implicit none
print*,"fib(6) =",fib(6) ! 8
end program test_fib
```
Abstract Syntax Tree from gfortran
``` .f90
Namespace: A-Z: (UNKNOWN 0)
procedure name = fib_mod
  symtree: 'fib'         || symbol: 'fib'          
    type spec : (INTEGER 4)
    attributes: (PROCEDURE MODULE-PROC  FUNCTION ELEMENTAL PURE CONTAINED ALWAYS-EXPLICIT)
    result: ifib
    Formal arglist: i
  symtree: 'fib_mod'     || symbol: 'fib_mod'      
    type spec : (UNKNOWN 0)
    attributes: (MODULE )

  code:
CONTAINS

  Namespace: A-Z: (UNKNOWN 0)
  procedure name = fib
    symtree: 'fib'         || symbol: 'fib' from namespace 'fib_mod'
    symtree: 'fib_old'     || symbol: 'fib_old'      
      type spec : (INTEGER 4)
      attributes: (VARIABLE  DIMENSION)
      Array spec:(1 [0] AS_EXPLICIT 1 2 )
    symtree: 'i'           || symbol: 'i'            
      type spec : (INTEGER 4)
      attributes: (VARIABLE  DUMMY(IN))
    symtree: 'ifib'        || symbol: 'ifib'         
      type spec : (INTEGER 4)
      attributes: (VARIABLE  RESULT ALWAYS-EXPLICIT)
    symtree: 'j'           || symbol: 'j'            
      type spec : (INTEGER 4)
      attributes: (VARIABLE )
    symtree: 'merge'       || symbol: 'merge'        
      type spec : (UNKNOWN 0)
      attributes: (PROCEDURE INTRINSIC-PROC  FUNCTION ARRAY-OUTER-DEPENDENCY)
      result: merge

    code:
    ASSIGN fib:ifib __merge_i4[[((0) (1) ((< fib:i 1)))]]
    IF (< fib:i 3)
      RETURN 
    ENDIF
    ASSIGN fib:fib_old(FULL) (/ 1 , 1 /)
    DO fib:j=3 fib:i 1
      ASSIGN fib:ifib (+ fib:fib_old(1) fib:fib_old(2))
      IF (== fib:j fib:i)
        EXIT
      ENDIF
      ASSIGN fib:fib_old(FULL) (/ fib:ifib , fib:fib_old(1) /)
    END DO
    
Namespace: A-Z: (UNKNOWN 0)
procedure name = test_fib
  symtree: 'fib'         || symbol: 'fib'          
    type spec : (INTEGER 4)
    attributes: (PROCEDURE MODULE-PROC  USE-ASSOC(fib_mod) FUNCTION ELEMENTAL PURE ALWAYS-EXPLICIT)
    result: ifib
    Formal arglist: i
  symtree: 'fib_mod'     || symbol: 'fib_mod'      
    type spec : (UNKNOWN 0)
    attributes: (MODULE  USE-ASSOC(fib_mod))
  symtree: 'test_fib'    || symbol: 'test_fib'     
    type spec : (UNKNOWN 0)
    attributes: (PROGRAM PUBLIC  SUBROUTINE IS-MAIN-PROGRAM)

  code:
  WRITE UNIT=6 FMT=-1
  TRANSFER 'fib(6) ='
  TRANSFER fib[[((6))]]
  DT_END
 ```
