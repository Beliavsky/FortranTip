### Gfortran compilation stages
The abstract syntax tree of two codes can be compared to verify that their differences are only cosmetic (such as free vs. fixed source form).
The intermediate and assembly codes of different source codes and optimization levels can be compared to understand speed differences.

#### Fortran source fib.f90
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
#### Abstract Syntax Tree from `gfortran -fdump-fortran-original -fdump-tree-original fib.f90`
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
 #### C-like intermediate code from `gfortran -fdump-fortran-original -fdump-tree-original fib.f90`
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
#### Assembly code produced by `gfortran -S -fverbose-asm fib.f90` on Windows, which shows the assembly corresponding to each source line.
```	.file	"fib.f90"
 # GNU Fortran2008 (GCC) version 12.0.1 20220213 (experimental) (x86_64-w64-mingw32)
 #	compiled by GNU C version 12.0.0 20220116 (experimental), GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version none
 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed: -mtune=generic -march=x86-64 -fintrinsic-modules-path c:/equation/bin/../lib/gcc/x86_64-w64-mingw32/12.0.1/finclude
	.text
	.globl	__fib_mod_MOD_fib
	.def	__fib_mod_MOD_fib;	.scl	2;	.type	32;	.endef
	.seh_proc	__fib_mod_MOD_fib
__fib_mod_MOD_fib:
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 #,
	.seh_setframe	%rbp, 0
	subq	$96, %rsp	 #,
	.seh_stackalloc	96
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 # i, i
 # fib.f90:7: ifib = merge(0, 1, i<1)
	movq	16(%rbp), %rax	 # i, tmp99
	movl	(%rax), %eax	 # *i_21(D), _1
	testl	%eax, %eax	 # _1
	setg	%al	 #, tmp100
	movzbl	%al, %eax	 # tmp100, _2
	movl	%eax, -4(%rbp)	 # _2, ifib
 # fib.f90:8: if (i < 3) return
	movq	16(%rbp), %rax	 # i, tmp101
	movl	(%rax), %eax	 # *i_21(D), _3
	cmpl	$2, %eax	 #, _3
	jg	.L2	 #,
 # fib.f90:8: if (i < 3) return
	movl	-4(%rbp), %eax	 # ifib, _16
	jmp	.L9	 #
.L2:
	movq	A.0.1(%rip), %rax	 # MEM <unsigned long long> [(c_char * {ref-all})&A.0], _23
 # fib.f90:9: fib_old = [1,1]
	movq	%rax, -16(%rbp)	 # _23, MEM <unsigned long long> [(c_char * {ref-all})&fib_old]
 # fib.f90:10: do j=3,i
	movq	16(%rbp), %rax	 # i, tmp102
	movl	(%rax), %edx	 # *i_21(D), _25
 # fib.f90:10: do j=3,i
	movl	$3, -8(%rbp)	 #, j
.L8:
 # fib.f90:10: do j=3,i
	cmpl	%edx, -8(%rbp)	 # _25, j
	setg	%al	 #, tmp103
	movzbl	%al, %eax	 # tmp103, _27
	testl	%eax, %eax	 # _27
	jne	.L10	 #,
 # fib.f90:11:    ifib = fib_old(1) + fib_old(2)
	movl	-16(%rbp), %ecx	 # fib_old[0], _4
	movl	-12(%rbp), %eax	 # fib_old[1], _5
	addl	%ecx, %eax	 # _4, tmp104
	movl	%eax, -4(%rbp)	 # tmp104, ifib
 # fib.f90:12:    if (j == i) exit
	movq	16(%rbp), %rax	 # i, tmp105
	movl	(%rax), %eax	 # *i_21(D), _6
	cmpl	%eax, -8(%rbp)	 # _6, j
	je	.L11	 #,
 # fib.f90:13:    fib_old = [ifib,fib_old(1)]
	movq	$0, -80(%rbp)	 #, atmp.1.dtype
	movq	$0, -72(%rbp)	 #, atmp.1.dtype
	movq	$4, -80(%rbp)	 #, atmp.1.dtype.elem_len
	movb	$1, -68(%rbp)	 #, atmp.1.dtype.rank
	movb	$1, -67(%rbp)	 #, atmp.1.dtype.type
	movq	$1, -56(%rbp)	 #, atmp.1.dim[0].stride
	movq	$0, -48(%rbp)	 #, atmp.1.dim[0].lbound
	movq	$1, -40(%rbp)	 #, atmp.1.dim[0].ubound
	movq	$4, -64(%rbp)	 #, atmp.1.span
	leaq	-24(%rbp), %rax	 #, tmp106
	movq	%rax, -96(%rbp)	 # tmp106, atmp.1.data
	movq	$0, -88(%rbp)	 #, atmp.1.offset
	movq	-96(%rbp), %rax	 # atmp.1.data, _7
	movl	-4(%rbp), %ecx	 # ifib, tmp107
	movl	%ecx, (%rax)	 # tmp107, MEM[(integer(kind=4)[2] *)_7][0]
	movq	-96(%rbp), %rax	 # atmp.1.data, _8
	movl	-16(%rbp), %ecx	 # fib_old[0], _9
	movl	%ecx, 4(%rax)	 # _9, MEM[(integer(kind=4)[2] *)_8][1]
	movl	$0, %eax	 #, S.4_15
.L7:
 # fib.f90:13:    fib_old = [ifib,fib_old(1)]
	cmpq	$1, %rax	 #, S.4_15
	jg	.L6	 #,
 # fib.f90:13:    fib_old = [ifib,fib_old(1)]
	movq	-96(%rbp), %rcx	 # atmp.1.data, _10
	movl	(%rcx,%rax,4), %ecx	 # MEM[(integer(kind=4)[2] *)_10][S.4_15], _11
	movl	%ecx, -16(%rbp,%rax,4)	 # _11, fib_old[S.4_15]
	addq	$1, %rax	 #, S.4_15
	jmp	.L7	 #
.L6:
 # fib.f90:10: do j=3,i
	addl	$1, -8(%rbp)	 #, j
	jmp	.L8	 #
.L10:
 # fib.f90:13:    fib_old = [ifib,fib_old(1)]
	nop	
	jmp	.L4	 #
.L11:
 # fib.f90:12:    if (j == i) exit
	nop	
.L4:
 # fib.f90:15: end function fib
	movl	-4(%rbp), %eax	 # ifib, _16
.L9:
 # fib.f90:15: end function fib
	addq	$96, %rsp	 #,
	popq	%rbp	 #
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "fib.f90\0"
.LC1:
	.ascii "fib(6) ="
	.align 4
.LC2:
	.long	6
	.text
	.def	MAIN__;	.scl	3;	.type	32;	.endef
	.seh_proc	MAIN__
MAIN__:
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	subq	$576, %rsp	 #,
	.seh_stackalloc	576
	leaq	128(%rsp), %rbp	 #,
	.seh_setframe	%rbp, 128
	.seh_endprologue
 # fib.f90:21: print*,"fib(6) =",fib(6) ! 8
	leaq	.LC0(%rip), %rax	 #, tmp83
	movq	%rax, -88(%rbp)	 # tmp83, dt_parm.5.common.filename
	movl	$21, -80(%rbp)	 #, dt_parm.5.common.line
	movl	$128, -96(%rbp)	 #, dt_parm.5.common.flags
	movl	$6, -92(%rbp)	 #, dt_parm.5.common.unit
	leaq	-96(%rbp), %rax	 #, tmp84
	movq	%rax, %rcx	 # tmp84,
	call	_gfortran_st_write	 #
 # fib.f90:21: print*,"fib(6) =",fib(6) ! 8
	leaq	-96(%rbp), %rax	 #, tmp85
	movl	$8, %r8d	 #,
	leaq	.LC1(%rip), %rdx	 #, tmp86
	movq	%rax, %rcx	 # tmp85,
	call	_gfortran_transfer_character_write	 #
 # fib.f90:21: print*,"fib(6) =",fib(6) ! 8
	leaq	.LC2(%rip), %rax	 #, tmp87
	movq	%rax, %rcx	 # tmp87,
	call	__fib_mod_MOD_fib	 #
	movl	%eax, 444(%rbp)	 # _1, D.4259
	leaq	444(%rbp), %rdx	 #, tmp88
	leaq	-96(%rbp), %rax	 #, tmp89
	movl	$4, %r8d	 #,
	movq	%rax, %rcx	 # tmp89,
	call	_gfortran_transfer_integer_write	 #
 # fib.f90:21: print*,"fib(6) =",fib(6) ! 8
	leaq	-96(%rbp), %rax	 #, tmp90
	movq	%rax, %rcx	 # tmp90,
	call	_gfortran_st_write_done	 #
 # fib.f90:22: end program test_fib
	nop	
	addq	$576, %rsp	 #,
	popq	%rbp	 #
	ret	
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 #,
	.seh_setframe	%rbp, 0
	subq	$32, %rsp	 #,
	.seh_stackalloc	32
	.seh_endprologue
	movl	%ecx, 16(%rbp)	 # argc, argc
	movq	%rdx, 24(%rbp)	 # argv, argv
 # fib.f90:19: use fib_mod, only: fib
	call	__main	 #
	movq	24(%rbp), %rdx	 # argv, tmp84
	movl	16(%rbp), %eax	 # argc, tmp85
	movl	%eax, %ecx	 # tmp85,
	call	_gfortran_set_args	 #
	leaq	options.6.0(%rip), %rax	 #, tmp86
	movq	%rax, %rdx	 # tmp86,
	movl	$7, %ecx	 #,
	call	_gfortran_set_options	 #
	call	MAIN__	 #
	movl	$0, %eax	 #, _7
	addq	$32, %rsp	 #,
	popq	%rbp	 #
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
A.0.1:
	.long	1
	.long	1
	.align 16
options.6.0:
	.long	2116
	.long	4095
	.long	0
	.long	1
	.long	1
	.long	0
	.long	31
	.ident	"GCC: (GNU) 12.0.1 20220213 (experimental)"
	.def	_gfortran_st_write;	.scl	2;	.type	32;	.endef
	.def	_gfortran_transfer_character_write;	.scl	2;	.type	32;	.endef
	.def	_gfortran_transfer_integer_write;	.scl	2;	.type	32;	.endef
	.def	_gfortran_st_write_done;	.scl	2;	.type	32;	.endef
	.def	_gfortran_set_args;	.scl	2;	.type	32;	.endef
	.def	_gfortran_set_options;	.scl	2;	.type	32;	.endef
```
