# FortranTip
Short instructional Fortran codes associated with Twitter [@FortranTip](https://twitter.com/fortrantip) . Search tips and run codes at [FortranTipBrowser](https://zmoon.github.io/FortranTipBrowser/).

### Index of Tweets, Most Recent First, With Associated Code
[DIMENSION can be used to declare several arrays of the same SHAPE](https://twitter.com/fortrantip/status/1480162604559523840) 8:00 AM · Jan 9, 2022<br>
[Propagation of an optional argument](https://twitter.com/fortrantip/status/1479805991382360066) 8:23 AM · Jan 8, 2022 [optional_use.f90](./optional_use.f90)<br>
[Two types of syntax for defining a function](https://twitter.com/fortrantip/status/1479641195898826754) 9:28 PM · Jan 7, 2022 [function.f90](./function.f90) [function.txt](./function.txt)<br>
[Syntax for character array without manual padding](https://twitter.com/fortrantip/status/1479487784205402116) 11:19 AM · Jan 7, 2022 [character_array.f90](./character_array.f90)<br>
[Intrinsic character functions](https://twitter.com/fortrantip/status/1479391930744283144) 4:58 AM · Jan 7, 2022 [string_func.f90](./string_func.f90)<br>
[Substrings of character variable arrays](https://twitter.com/fortrantip/status/1479128610623606787) 11:31 AM · Jan 6, 2022 [substring.f90](./substring.f90)<br>
[Parenthesize a variable to copy it "on the fly".](https://twitter.com/fortrantip/status/1479071485859962880) 7:44 AM · Jan 6, 2022 [overlapping_arg.f90](./overlapping_arg.f90)<br>
[Use integer powers when possible.](https://twitter.com/fortrantip/status/1478765410405298176) 11:28 AM · Jan 5, 2022 [pow_real.f90](./pow_real.f90)<br>
[Use d0 or \_kind to make a constant double precision.](https://twitter.com/fortrantip/status/1478713534850736129) 8:02 AM · Jan 5, 2022 [precision.f90](./precision.f90)<br>
[KIND numbers of types are not portable across compilers and should not be used directly.](https://twitter.com/fortrantip/status/1478526602136981511) 7:39 PM · Jan 4, 2022<br>
[Avoid implicit save](https://twitter.com/fortrantip/status/1478363292028784645) 8:50 AM · Jan 4, 2022 [implicit_save.f90](./implicit_save.f90): [run](https://onlinegdb.com/BCZzmjYxs)<br>
[Use parameters to dimension fixed-size arrays to make a code easier to change](https://twitter.com/fortrantip/status/1478331686412861440) 6:45 AM · Jan 4, 2022<br>
[Fortran 2008 introduced z%re and z%im as alternatives to real(z) and aimag(z)](https://twitter.com/fortrantip/status/1478160269671124993) 7:24 PM · Jan 3, 2022 [im_re.f90](./im_re.f90)<br>
[KindFinder code finds all KIND Values implemented by a compiler](https://twitter.com/fortrantip/status/1478030318485577728) 10:47 AM · Jan 3, 2022 [kindfind.f90](./kindfind.f90)<br>
[Real and integer KIND constants from iso_fortran_env; HUGE() and TINY()](https://twitter.com/fortrantip/status/1477985901145993221) 7:51 AM · Jan 3, 2022 [iso_kinds.f90](./iso_kinds.f90)<br>
[Advance="no" specifier of WRITE](https://twitter.com/fortrantip/status/1477788560359141382) 6:47 PM · Jan 2, 2022 [advance_no.f90](./advance_no.f90)<br>
[Len of character variable function result can depend on arguments](https://twitter.com/fortrantip/status/1477632693617799169) 8:27 AM · Jan 2, 2022 [join.f90](./join.f90)<br>
[How size of an array function result can depend on function arguments](https://twitter.com/fortrantip/status/1477606275643019269) 6:42 AM · Jan 2, 2022 [array_func.f90](./array_func.f90)<br>
[Do case-insensitive string comparisons by converting to lower case](https://twitter.com/fortrantip/status/1477278656376590340) 9:00 AM · Jan 1, 2022 [lower_case.f90](./lower_case.f90)<br>
[Fortran-lang suggested variable naming conventions](https://twitter.com/fortrantip/status/1477282631553269764) 9:16 AM · Jan 1, 2022<br>
[Case insensitivity](https://twitter.com/fortrantip/status/1477230568781795334) 10:49 AM · Jan 1, 2022 [case_insensitivity.f90](./case_insensitivity.f90)<br>
[Returning multiple values from a subroutine or function](https://twitter.com/fortrantip/status/1476724929299197962) 8:20 PM · Dec 30, 2021 [subroutine_dt.f90](https://github.com/Beliavsky/FortranTip/blob/main/subroutine_dt.f90)<br>
[MODULO vs. MOD function](https://twitter.com/fortrantip/status/1476541936681066501) 7:13 AM · Dec 30, 2021<br>
[Compiler Support for the Fortran 2008 and 2018 Standards](https://twitter.com/fortrantip/status/1476281645011505162) 1:59 PM · Dec 29, 2021<br>
[Many compilers evaluate ALL(x==y) efficiently with short-circuiting](https://twitter.com/fortrantip/status/1476255945923641347) 12:16 PM · Dec 29, 2021<br>
[LEN of a character variable may be deferred in Fortran 2003 on](https://twitter.com/fortrantip/status/1476201645885337611) 8:41 AM · Dec 29, 2021 [deferred_character.f90](https://github.com/Beliavsky/FortranTip/blob/main/deferred_character.f90)<br>
[To learn about Fortran beyond F95, read the New Features articles of John Reid](https://twitter.com/fortrantip/status/1476150602866511873) 5:18 AM · Dec 29, 2021<br>
[Use .true. and .false. for Booleans, not 1 and 0](https://twitter.com/fortrantip/status/1475905587774959616) 1:04 PM · Dec 28, 2021<br>
[Standards committee has approved conditional expressions](https://twitter.com/fortrantip/status/1475840940791279616) 8:47 AM · Dec 28, 2021<br>
[ANY and ALL may not be the most efficient methods to compare arrays.](https://twitter.com/fortrantip/status/1475829444543717378) 8:02 AM · Dec 28, 2021<br>
[Consider using a tolerance to compare floats](https://twitter.com/fortrantip/status/1475826650835214338) 7:51 AM · Dec 28, 2021 [compare_floats.f90](https://github.com/Beliavsky/FortranTip/blob/main/compare_floats.f90)<br>
[Use ALL(A==B) to test for array equality](https://twitter.com/fortrantip/status/1475822105358913540) 7:33 AM · Dec 28, 2021 [all_any.f90](https://github.com/Beliavsky/FortranTip/blob/main/all_any.f90)<br>
[Intel Fortran Compiler (ifx)](https://twitter.com/fortrantip/status/1475494838074318852) 9:52 AM · Dec 27, 2021<br>
[Doubled delimiter in a string is regarded as a single character of the constant](https://twitter.com/fortrantip/status/1475453317526528003) 7:07 AM · Dec 27, 2021 [doubled_delim.f90](https://github.com/Beliavsky/FortranTip/blob/main/doubled_delim.f90)<br>
[Store data as an array of derived types or a derived type with array components?](https://twitter.com/fortrantip/status/1475133178763427848) 9:55 AM · Dec 26, 2021 [derived_type_array.f90](https://github.com/Beliavsky/FortranTip/blob/main/derived_type_array.f90)<br>
[Fortran is column-major](https://twitter.com/fortrantip/status/1475049356155883524) 4:22 AM · Dec 26, 2021 [column_major.f90](https://github.com/Beliavsky/FortranTip/blob/main/column_major.f90)<br>
[CMPLX should be used with a KIND argument](https://twitter.com/fortrantip/status/1474537984066301959) 6:30 PM · Dec 24, 2021 [cmplx.f90](https://github.com/Beliavsky/FortranTip/blob/main/cmplx.f90)<br>
[RESHAPE with the optional ORDER and PAD arguments](https://twitter.com/fortrantip/status/1474394605890244614) 9:00 AM · Dec 24, 2021 [reshape_array.f90](https://github.com/Beliavsky/FortranTip/blob/main/reshape_array.f90)<br>
[Use GAMMA to compute factorials](https://twitter.com/fortrantip/status/1474357943667671060) 6:35 AM · Dec 24, 2021 [factorial.f90](https://github.com/Beliavsky/FortranTip/blob/main/factorial.f90)<br>
[Derived type definition, initialization, and operator overloading](https://twitter.com/fortrantip/status/1474169072665440259) 6:04 PM · Dec 23, 2021 [date.f90](https://github.com/Beliavsky/FortranTip/blob/main/date.f90)<br>
[List-directed vs. explicitly formatted output](https://twitter.com/fortrantip/status/1474105626611662857) 1:52 PM · Dec 23, 2021<br>
[Fortran equivalents of NumPy](https://twitter.com/fortrantip/status/1473958733571104773) 4:08 AM · Dec 23, 2021<br>
[Zero-size array constructor such as [real ::]](https://twitter.com/fortrantip/status/1473848675566858242) 8:51 PM · Dec 22, 2021 [zero_size.f90](https://github.com/Beliavsky/FortranTip/blob/main/zero_size.f90)<br>
[Use G0.d and colon edit descriptors with infinite repeat count to write delimited (CSV, etc.) output](https://twitter.com/fortrantip/status/1473680777279852553) 9:44 AM · Dec 22, 2021<br>
[If allocation errors must be handled, use ALLOCATABLE rather than automatic arrays in procedures](https://twitter.com/fortrantip/status/1473636468405030913) 6:48 AM · Dec 22, 2021 [automatic.f90](https://github.com/Beliavsky/FortranTip/blob/main/automatic.f90)<br>
[Name modules and the source files containing them consistently, with one module per file.](https://twitter.com/fortrantip/status/1473340740055015431) 11:13 AM · Dec 21, 2021<br>
[Use unformatted stream of Fortran 2003 for large-scale I/O.](https://twitter.com/fortrantip/status/1473261954244435973) 5:59 AM · Dec 21, 2021 [stream_io.f90](https://github.com/Beliavsky/FortranTip/blob/main/stream_io.f90)<br>
[Using READ and WRITE for file i/o](https://twitter.com/fortrantip/status/1472999893631447043) 12:38 PM · Dec 20, 2021 [read_write_file.f90](https://github.com/Beliavsky/FortranTip/blob/main/read_write_file.f90)<br>
[Reading user input](https://twitter.com/fortrantip/status/1472941850218700805) 8:47 AM · Dec 20, 2021 [read_sum.f90](https://github.com/Beliavsky/FortranTip/blob/main/read_sum.f90)<br>
[SELECT CASE for conditional execution](https://twitter.com/fortrantip/status/1472930444572336128) 8:02 AM · Dec 20, 2021 [select_case.f90](https://github.com/Beliavsky/FortranTip/blob/main/select_case.f90)<br>
[Declare floating point variables with KINDs](https://twitter.com/fortrantip/status/1472771842242920451) 9:32 PM · Dec 19, 2021 [kind.f90](https://github.com/Beliavsky/FortranTip/blob/main/kind.f90)<br>
[Replace non-standard REAL\*8 declaration with REAL(KIND=REAL64)](https://twitter.com/fortrantip/status/1472772577600942083) 9:35 PM · Dec 19, 2021<br>
[Use PARAMETERs in modules to define physical and mathematical constants](https://twitter.com/fortrantip/status/1472718436040073226) 6:00 PM · Dec 19, 2021 [module_parameter.f90](https://github.com/Beliavsky/FortranTip/blob/main/module_parameter.f90)<br>
[Procedures can be RECURSIVE](https://twitter.com/fortrantip) 4:56 PM · Dec 19, 2021<br>
[Specify function and subroutine argument INTENTs](https://twitter.com/fortrantip/status/1472698233298333699) 4:39 PM · Dec 19, 2021<br>
[Subroutines can have INTENT(IN OUT) arguments, but functions should not](https://twitter.com/fortrantip/status/1472696912541364224) 4:34 PM · Dec 19, 2021 [intent_in_out.f90](https://github.com/Beliavsky/FortranTip/blob/main/intent_in_out.f90)<br>
[Define and call a subroutine](https://twitter.com/fortrantip/status/1472692305522044932) 4:16 PM · Dec 19, 2021 [subroutine.f90](https://github.com/Beliavsky/FortranTip/blob/main/subroutine.f90)<br>
[Demonstrate optional arguments and RANDOM_NUMBER](https://twitter.com/fortrantip/status/1472684194765672450) 3:44 PM · Dec 19, 2021 [optional.f90](https://github.com/Beliavsky/FortranTip/blob/main/optional.f90)<br>
[Function overloading using an interface with module procedures](https://twitter.com/fortrantip/status/1472629090758836229) 12:05 PM · Dec 19, 2021 [interface.f90](https://github.com/Beliavsky/FortranTip/blob/main/interface.f90)<br>
[USE, ONLY to avoid polluting the namespace](https://twitter.com/fortrantip/status/1472613921886552065) 11:04 AM · Dec 19, 2021<br>
[Put functions and subroutines in modules to ensure that interfaces are checked.](https://twitter.com/fortrantip/status/1472610403884670976) 10:50 AM · Dec 19, 2021<br>
[ELEMENTAL functions broadcast arguments](https://twitter.com/fortrantip/status/1472606914857078793) 10:37 AM · Dec 19, 2021<br>
[Functions should be PURE and have INTENT(IN) arguments](https://twitter.com/fortrantip/status/1472603894886932482) 10:25 AM · Dec 19, 2021<br>
[PACK selects elements](https://twitter.com/fortrantip/status/1472600871192125451) 10:13 AM · Dec 19, 2021<br>
[Loop variable equals the upper bound plus the stride after normal completion of a loop](https://twitter.com/fortrantip/status/1472598697489965061) 10:04 AM · Dec 19, 2021<br>
[Associate creates an alias for expressions or variables.](https://twitter.com/fortrantip/status/1472565511628197891) 7:52 AM · Dec 19, 2021<br>
[In addition to if-elseif, Fortran has a one-line if](https://twitter.com/fortrantip/status/1472365082067755017) 6:36 PM · Dec 18, 2021<br>
[Character variables are padded with spaces at the end if necessary.](https://twitter.com/fortrantip/status/1472209602074849285) 8:18 AM · Dec 18, 2021<br>
[An array of character variables has elements of the same LEN(gth).](https://twitter.com/fortrantip/status/1472207576133783564) 8:10 AM · Dec 18, 2021<br>
[MERGE(x,y,condition) returns x if condition is true, otherwise y](https://twitter.com/fortrantip/status/1472205323763073026) 8:01 AM · Dec 18, 2021<br>
[IF-ELSEIF-ENDIF block](https://twitter.com/fortrantip/status/1472202678054920196) 7:50 AM · Dec 18, 2021<br>
[New Fortran code should be written using free source form and stored in a file with the .f90 suffix.](https://twitter.com/fortrantip/status/1472183935044145157) 6:36 AM · Dec 18, 2021<br>
[Fortran has allocation on assignment.](https://twitter.com/fortrantip/status/1472181598833549316) 6:26 AM · Dec 18, 2021<br>
[SUM and other array functions have an optional DIM(ension) argument.](https://twitter.com/fortrantip/status/1472018791525720069) 7:40 PM · Dec 17, 2021<br>
[Fortran arrays can have any lower bound. The default is 1.](https://twitter.com/fortrantip/status/1471997763848183810) 6:16 PM · Dec 17, 2021<br>
[Fortran array sections contain both endpoints](https://twitter.com/fortrantip/status/1471994100161388545) 6:01 PM · Dec 17, 2021<br>
[Array intrinsic functions: SUM, MINVAL, MAXVAL, MINLOC, FINDLOC](https://twitter.com/fortrantip/status/1471989760046641153) 5:44 PM · Dec 17, 2021<br>
[Integer division truncates.](https://twitter.com/fortrantip/status/1471936756857643008) 2:14 PM · Dec 17, 2021<br>
[\** is the exponentiation operator.](https://twitter.com/fortrantip/status/1471903802185986050) 12:03 PM · Dec 17, 2021<br>
[Fortran compilers and tutorials](https://twitter.com/fortrantip/status/1471897319671046147) 11:37 AM · Dec 17, 2021<br>
[EXIT a loop](https://twitter.com/fortrantip/status/1471895490346291206) 11:30 AM · Dec 17, 2021<br>
[DO-ENDDO loop](https://twitter.com/fortrantip/status/1471891644370796550) 11:14 AM · Dec 17, 2021<br>
[Intrinsic data types: integer, real, complex, logical, and character](https://twitter.com/fortrantip/status/1471890355561943054) 11:09 AM · Dec 17, 2021<br>
[Hello World](https://twitter.com/fortrantip/status/1471887565745799173) 10:58 AM · Dec 17, 2021


