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
 C-like intermediate code
 ``` .c
 __attribute__((fn spec (". r ")))
integer(kind=4) fib (integer(kind=4) & restrict i)
{
  integer(kind=4) fib_old[2];
  integer(kind=4) ifib;
  integer(kind=4) j;

  {
    static integer(kind=4) A.0[2] = {1, 1};

    ifib = (integer(kind=4)) (*i > 0);
    if (*i <= 2)
      {
        return ifib;
      }
    L.1:;
    (void) __builtin_memcpy ((void *) &fib_old, (void *) &A.0, 8);
    {
      integer(kind=4) D.4223;

      D.4223 = *i;
      j = 3;
      while (1)
        {
          {
            logical(kind=4) D.4226;

            D.4226 = j > D.4223;
            if (D.4226) goto L.3;
            ifib = fib_old[0] + fib_old[1];
            if (*i == j) goto L.3;
            L.4:;
            {
              struct array01_integer(kind=4) atmp.1;
              integer(kind=4) A.2[2];

                            typedef integer(kind=4) [2];
              atmp.1.dtype = {.elem_len=4, .rank=1, .type=1};
              atmp.1.dim[0].stride = 1;
              atmp.1.dim[0].lbound = 0;
              atmp.1.dim[0].ubound = 1;
              atmp.1.span = 4;
              atmp.1.data = (void * restrict) &A.2;
              atmp.1.offset = 0;
              (*(integer(kind=4)[2] * restrict) atmp.1.data)[0] = ifib;
              (*(integer(kind=4)[2] * restrict) atmp.1.data)[1] = fib_old[0];
              {
                integer(kind=8) S.4;

                S.4 = 0;
                while (1)
                  {
                    if (S.4 > 1) goto L.5;
                    fib_old[S.4] = (*(integer(kind=4)[2] * restrict) atmp.1.data)[S.4];
                    S.4 = S.4 + 1;
                  }
                L.5:;
              }
            }
            L.2:;
            j = j + 1;
          }
        }
      L.3:;
    }
  }
  return ifib;
}


__attribute__((fn spec (". ")))
void test_fib ()
{
  {
    struct __st_parameter_dt dt_parm.5;

    dt_parm.5.common.filename = &"fib.f90"[1]{lb: 1 sz: 1};
    dt_parm.5.common.line = 21;
    dt_parm.5.common.flags = 128;
    dt_parm.5.common.unit = 6;
    _gfortran_st_write (&dt_parm.5);
    _gfortran_transfer_character_write (&dt_parm.5, &"fib(6) ="[1]{lb: 1 sz: 1}, 8);
    {
      static integer(kind=4) C.4258 = 6;
      integer(kind=4) D.4259;

      D.4259 = fib (&C.4258);
      _gfortran_transfer_integer_write (&dt_parm.5, &D.4259, 4);
    }
    _gfortran_st_write_done (&dt_parm.5);
  }
}


__attribute__((externally_visible))
integer(kind=4) main (integer(kind=4) argc, character(kind=1) * * argv)
{
  static integer(kind=4) options.6[7] = {2116, 4095, 0, 1, 1, 0, 31};

  _gfortran_set_args (argc, argv);
  _gfortran_set_options (7, &options.6[0]);
  test_fib ();
  return 0;
}
```
