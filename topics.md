# Fortran Tips by Topic
Short instructional Fortran codes associated with Twitter [@FortranTip](https://twitter.com/fortrantip) . Search tips and run codes at [FortranTipBrowser](https://zmoon.github.io/FortranTipBrowser/).

### Fortran resources
[Fortran compilers and tutorials](https://twitter.com/fortrantip/status/1471897319671046147) 11:37 AM · Dec 17, 2021<br>
[Intel Fortran Compiler (ifx)](https://twitter.com/fortrantip/status/1475494838074318852) 9:52 AM · Dec 27, 2021<br>
[To learn about Fortran beyond F95, read the New Features articles of John Reid](https://twitter.com/fortrantip/status/1476150602866511873) 5:18 AM · Dec 29, 2021<br>
[Compiler Support for the Fortran 2008 and 2018 Standards](https://twitter.com/fortrantip/status/1476281645011505162) 1:59 PM · Dec 29, 2021<br>
[Fortran-lang suggested variable naming conventions](https://twitter.com/fortrantip/status/1477282631553269764) 9:16 AM · Jan 1, 2022<br>
[List of the syntax and purpose of Fortran intrinsics, with usage examples](https://twitter.com/fortrantip/status/1477320332751130625) 11:46 AM · Jan 1, 2022<br>
[List of Fortran compilers, build tools, text editors, etc.](https://twitter.com/fortrantip/status/1482709817466707969) 8:42 AM · Jan 16, 2022 [list](https://github.com/Beliavsky/Fortran-Tools)<br>
[Google foo filetype:f90 or foo filetype:f to find Fortran code with foo.](https://twitter.com/fortrantip/status/1487557071818084357) 5:43 PM · Jan 29, 2022<br>
[Polyhedron suggested compiler optimization options and Fortran 95 benchmarks](https://twitter.com/fortrantip/status/1487791193710866437) 9:13 AM · Jan 30, 2022<br>
[Mistakes in Fortran 90 Programs That Might Surprise You, by Szymanski](https://twitter.com/fortrantip/status/1488844789575569408) 7:00 AM · Feb 2, 2022<br>
[Modern Fortran Reference Card and Quick Reference/Cheat Sheet.](https://twitter.com/fortrantip/status/1493920435997659145) 7:09 AM · Feb 16, 2022<br>
[Five free C C++ Fortran compiler families](https://twitter.com/fortrantip/status/1498291406556876806) 8:38 AM · Feb 28, 2022<br>

### Basics
[Hello World](https://twitter.com/fortrantip/status/1471887565745799173) 10:58 AM · Dec 17, 2021 [hello_world.f90](./hello_world.f90)<br>
[\** is the exponentiation operator.](https://twitter.com/fortrantip/status/1471903802185986050) 12:03 PM · Dec 17, 2021 [power.f90](./power.f90)<br>
[Integer division truncates.](https://twitter.com/fortrantip/status/1471936756857643008) 2:14 PM · Dec 17, 2021<br>
[Consider using a tolerance to compare floats](https://twitter.com/fortrantip/status/1475826650835214338) 7:51 AM · Dec 28, 2021 [compare_floats.f90](./compare_floats.f90)<br>
[Case insensitivity](https://twitter.com/fortrantip/status/1477230568781795334) 10:49 AM · Jan 1, 2022 [case_insensitivity.f90](./case_insensitivity.f90)<br>
[Use integer powers when possible.](https://twitter.com/fortrantip/status/1478765410405298176) 11:28 AM · Jan 5, 2022 [pow_real.f90](./pow_real.f90)<br>
[Parenthesize a variable to copy it "on the fly".](https://twitter.com/fortrantip/status/1479071485859962880) 7:44 AM · Jan 6, 2022 [overlapping_arg.f90](./overlapping_arg.f90)<br>
[ERROR STOP vs. STOP.](https://twitter.com/fortrantip/status/1497181532146089985) 7:07 AM · Feb 25, 2022 [error_stop.f90](./error_stop.f90)<br>
[BLOCK construct allows declarations after executable statements.](https://twitter.com/fortrantip/status/1498646417778548736) 8:08 AM · Mar 1, 2022 [block.f90](./block.f90)<br>

### Style
[New Fortran code should be written using free source form and stored in a file with the .f90 suffix.](https://twitter.com/fortrantip/status/1472183935044145157) 6:36 AM · Dec 18, 2021<br>
[Turn compiler warnings into errors to force code defects to be fixed.](https://twitter.com/fortrantip/status/1485235396179079173) 7:58 AM · Jan 23, 2022 [warnings.f90](./warnings.f90)<br>

### Data types
[Intrinsic data types: integer, real, complex, logical, and character](https://twitter.com/fortrantip/status/1471890355561943054) 11:09 AM · Dec 17, 2021<br>
[Replace non-standard REAL\*8 declaration with REAL(KIND=REAL64)](https://twitter.com/fortrantip/status/1472772577600942083) 9:35 PM · Dec 19, 2021<br>
[Declare floating point variables with KINDs](https://twitter.com/fortrantip/status/1472771842242920451) 9:32 PM · Dec 19, 2021 [kind.f90](./kind.f90)<br>
[CMPLX should be used with a KIND argument](https://twitter.com/fortrantip/status/1474537984066301959) 6:30 PM · Dec 24, 2021 [cmplx.f90](./cmplx.f90)<br>
[Use .true. and .false. for Booleans, not 1 and 0](https://twitter.com/fortrantip/status/1475905587774959616) 1:04 PM · Dec 28, 2021<br>
[Real and integer KIND constants from iso_fortran_env; HUGE() and TINY()](https://twitter.com/fortrantip/status/1477985901145993221) 7:51 AM · Jan 3, 2022 [iso_kinds.f90](./iso_kinds.f90)<br>
[KindFinder code finds all KIND Values implemented by a compiler](https://twitter.com/fortrantip/status/1478030318485577728) 10:47 AM · Jan 3, 2022 [kindfind.f90](./kindfind.f90)<br>
[Fortran 2008 introduced z%re and z%im as alternatives to real(z) and aimag(z)](https://twitter.com/fortrantip/status/1478160269671124993) 7:24 PM · Jan 3, 2022 [im_re.f90](./im_re.f90)<br>
[KIND numbers of types are not portable across compilers and should not be used directly.](https://twitter.com/fortrantip/status/1478526602136981511) 7:39 PM · Jan 4, 2022<br>
[Use d0 or \_kind to make a constant double precision.](https://twitter.com/fortrantip/status/1478713534850736129) 8:02 AM · Jan 5, 2022 [precision.f90](./precision.f90)<br>
[storage_size(A) returns the storage size of argument A in bits.](https://twitter.com/fortrantip/status/1495738404356689926) 7:33 AM · Feb 21, 2022 [storage_size.f90](./storage_size.f90)<br>

### Input and Output
[Reading user input](https://twitter.com/fortrantip/status/1472941850218700805) 8:47 AM · Dec 20, 2021 [read_sum.f90](./read_sum.f90)<br>
[Using READ and WRITE for file i/o](https://twitter.com/fortrantip/status/1472999893631447043) 12:38 PM · Dec 20, 2021 [read_write_file.f90](./read_write_file.f90)<br>
[Use unformatted stream of Fortran 2003 for large-scale I/O.](https://twitter.com/fortrantip/status/1473261954244435973) 5:59 AM · Dec 21, 2021 [stream_io.f90](./stream_io.f90)<br>
[Use G0.d and colon edit descriptors with infinite repeat count to write delimited (CSV, etc.) output](https://twitter.com/fortrantip/status/1473680777279852553) 9:44 AM · Dec 22, 2021<br>
[List-directed vs. explicitly formatted output](https://twitter.com/fortrantip/status/1474105626611662857) 1:52 PM · Dec 23, 2021<br>
[Advance="no" specifier of WRITE](https://twitter.com/fortrantip/status/1477788560359141382) 6:47 PM · Jan 2, 2022 [advance_no.f90](./advance_no.f90)<br>
[Use iostat and iomsg to handle READ errors](https://twitter.com/fortrantip/status/1482687630877892608) 7:14 AM · Jan 16, 2022 [iomsg.f90](./iomsg.f90) ; [data_file](./iomsg_data_file.txt)<br>
[Connect INPUT_UNIT and OUTPUT_UNIT to files to redirect standard input and output.](https://twitter.com/fortrantip/status/1502277940066893835) 8:39 AM · Mar 11, 2022 [output_unit.f90](./output_unit.f90)<br>
[Unit n is connected to fort.n by default for most compilers.](https://twitter.com/fortrantip/status/1502625494499536904) 7:40 AM · Mar 12, 2022 [implicitly_connected.f90](./implicitly_connected.f90)<br>

### Loops
[DO-ENDDO loop](https://twitter.com/fortrantip/status/1471891644370796550) 11:14 AM · Dec 17, 2021 [loop.f90](./loop.f90)<br>
[EXIT a loop](https://twitter.com/fortrantip/status/1471895490346291206) 11:30 AM · Dec 17, 2021 [sum_exit.f90](./sum_exit.f90)<br>
[Loop variable equals the upper bound plus the stride after normal completion of a loop](https://twitter.com/fortrantip/status/1472598697489965061) 10:04 AM · Dec 19, 2021 [do_loop_index.f90](./do_loop_index.f90)<br>

### Conditionals
[IF-ELSEIF-ENDIF block](https://twitter.com/fortrantip/status/1472202678054920196) 7:50 AM · Dec 18, 2021 [if.f90](./if.f90)<br>
[In addition to if-elseif, Fortran has a one-line if](https://twitter.com/fortrantip/status/1472365082067755017) 6:36 PM · Dec 18, 2021 [one_line_if.f90](./one_line_if.f90)<br>
[MERGE(x,y,condition) returns x if condition is true, otherwise y](https://twitter.com/fortrantip/status/1472205323763073026) 8:01 AM · Dec 18, 2021 [merge.f90](./merge.f90)<br>
[SELECT CASE for conditional execution](https://twitter.com/fortrantip/status/1472930444572336128) 8:02 AM · Dec 20, 2021 [select_case.f90](./select_case.f90)<br>
[ANY and ALL may not be the most efficient methods to compare arrays.](https://twitter.com/fortrantip/status/1475829444543717378) 8:02 AM · Dec 28, 2021<br>
[Standards committee has approved conditional expressions](https://twitter.com/fortrantip/status/1475840940791279616) 8:47 AM · Dec 28, 2021<br>

### Arrays
[Array intrinsic functions: SUM, MINVAL, MAXVAL, MINLOC, FINDLOC](https://twitter.com/fortrantip/status/1471989760046641153) 5:44 PM · Dec 17, 2021 [array_intrinsics.f90](./array_intrinsics.f90)<br>
[Fortran array sections contain both endpoints](https://twitter.com/fortrantip/status/1471994100161388545) 6:01 PM · Dec 17, 2021 [sections.f90](./sections.f90)<br>
[Fortran arrays can have any lower bound. The default is 1.](https://twitter.com/fortrantip/status/1471997763848183810) 6:16 PM · Dec 17, 2021 [bounds.f90](./bounds.f90)<br>
[SUM and other array functions have an optional DIM(ension) argument.](https://twitter.com/fortrantip/status/1472018791525720069) 7:40 PM · Dec 17, 2021 [2d_array.f90](./2d_array.f90)<br>
[PACK selects elements](https://twitter.com/fortrantip/status/1472600871192125451) 10:13 AM · Dec 19, 2021 [count_pack.f90](./count_pack.f90)<br>
[Zero-size array constructor such as [real ::]](https://twitter.com/fortrantip/status/1473848675566858242) 8:51 PM · Dec 22, 2021 [zero_size.f90](./zero_size.f90)<br>
[Fortran equivalents of NumPy](https://twitter.com/fortrantip/status/1473958733571104773) 4:08 AM · Dec 23, 2021<br>
[RESHAPE with the optional ORDER and PAD arguments](https://twitter.com/fortrantip/status/1474394605890244614) 9:00 AM · Dec 24, 2021 [reshape_array.f90](./reshape_array.f90)<br>
[Fortran is column-major](https://twitter.com/fortrantip/status/1475049356155883524) 4:22 AM · Dec 26, 2021 [column_major.f90](./column_major.f90)<br>
[Use ALL(A==B) to test for array equality](https://twitter.com/fortrantip/status/1475822105358913540) 7:33 AM · Dec 28, 2021 [all_any.f90](./all_any.f90)<br>
[Many compilers evaluate ALL(x==y) efficiently with short-circuiting](https://twitter.com/fortrantip/status/1476255945923641347) 12:16 PM · Dec 29, 2021<br>
[Use parameters to dimension fixed-size arrays to make a code easier to change](https://twitter.com/fortrantip/status/1478331686412861440) 6:45 AM · Jan 4, 2022<br>
[DIMENSION can be used to declare several arrays of the same SHAPE](https://twitter.com/fortrantip/status/1480162604559523840) 8:00 AM · Jan 9, 2022 [dimension.f90](./dimension.f90)<br>
[Array constructor with [] was introduced in Fortran 2003. Still valid is (//)](https://twitter.com/fortrantip/status/1483773578839474180) 7:09 AM · Jan 19, 2022<br>
[Vector subscript can be used for non-contiguous array sections.](https://twitter.com/fortrantip/status/1488132722761609216) 7:51 AM · Jan 31, 2022 [vector_subscript.f90](./vector_subscript.f90)<br>
[Setting the values of an array section](https://twitter.com/fortrantip/status/1488492649166295043) 7:41 AM · Feb 1, 2022 [truloc.f90](./truloc.f90)<br>
[Concatenate arrays and scalars in an array constructor []](https://twitter.com/fortrantip/status/1491021968799600641) 7:11 AM · Feb 8, 2022 [concatenate.f90](./concatenate.f90)<br>
[spread(source, dim, ncopies) copies a SOURCE array NCOPIES times along dimension DIM.](https://twitter.com/fortrantip/status/1491380119616700417) 6:55 AM · Feb 9, 2022 [spread.f90](./spread.f90)<br>
[How to reverse an array or character string](https://twitter.com/fortrantip/status/1492844114492243971) 7:52 AM · Feb 13, 2022 [reverse.f90](./reverse.f90)<br>

### Array arguments
[Array lower bounds are not preserved when passed as assumed shape argument.](https://twitter.com/fortrantip/status/1493207320184164352) 7:55 AM · Feb 14, 2022 [lbound_assumed_shape.f90](./lbound_assumed_shape.f90)<br>
[Bounds of a derived type array component are preserved when passed to procedure.](https://twitter.com/fortrantip/status/1493214664754438149) 8:24 AM · Feb 14, 2022 [lbound_assumed_shape.f90](./lbound_assumed_shape.f90)<br>
[Bounds of an allocatable array are preserved when passed to an allocatable, intent(in) or intent(in out) argument.](https://twitter.com/fortrantip/status/1493569929668354051) 7:56 AM · Feb 15, 2022 [allocatable_bounds.f90](./allocatable_bounds.f90)<br>
[Check that assumed-shape array arguments have consistent dimensions.](https://twitter.com/fortrantip/status/1497562564334694401) 8:21 AM · Feb 26, 2022 [error_handling.f90](./error_handling.f90)<br>

### Character variables
[An array of character variables has elements of the same LEN(gth).](https://twitter.com/fortrantip/status/1472207576133783564) 8:10 AM · Dec 18, 2021 [char.f90](./char.f90)<br>
[Character variables are padded with spaces at the end if necessary.](https://twitter.com/fortrantip/status/1472209602074849285) 8:18 AM · Dec 18, 2021<br>
[Doubled delimiter in a string is regarded as a single character of the constant](https://twitter.com/fortrantip/status/1475453317526528003) 7:07 AM · Dec 27, 2021 [doubled_delim.f90](./doubled_delim.f90)<br>
[LEN of a character variable may be deferred in Fortran 2003 on](https://twitter.com/fortrantip/status/1476201645885337611) 8:41 AM · Dec 29, 2021 [deferred_character.f90](./deferred_character.f90)<br>
[Do case-insensitive string comparisons by converting to lower case](https://twitter.com/fortrantip/status/1477278656376590340) 9:00 AM · Jan 1, 2022 [lower_case.f90](./lower_case.f90)<br>
[Substrings of character variable arrays](https://twitter.com/fortrantip/status/1479128610623606787) 11:31 AM · Jan 6, 2022 [substring.f90](./substring.f90)<br>
[Intrinsic character functions](https://twitter.com/fortrantip/status/1479391930744283144) 4:58 AM · Jan 7, 2022 [string_func.f90](./string_func.f90)<br>
[Syntax for character array without manual padding](https://twitter.com/fortrantip/status/1479487784205402116) 11:19 AM · Jan 7, 2022 [character_array.f90](./character_array.f90)<br>
[Convert from strings to numbers and the reverse using internal READ and WRITE.](https://twitter.com/fortrantip/status/1491754652030885888) 7:43 AM · Feb 10, 2022 [internal_read_write.f90](./internal_read_write.f90)<br>
[Internal write to character variable too small to hold output causes run-time error.](https://twitter.com/fortrantip/status/1492114908351283206) 7:34 AM · Feb 11, 2022 [write_char.f90](./write_char.f90)<br>
[Character variables can be compared like numerical variables.](https://twitter.com/fortrantip/status/1492489511821004805) 8:23 AM · Feb 12, 2022 [compare_character.f90](./compare_character.f90)<br>

### Allocation
[Fortran has allocation on assignment.](https://twitter.com/fortrantip/status/1472181598833549316) 6:26 AM · Dec 18, 2021 [alloc.f90](./alloc.f90)<br>
[If allocation errors must be handled, use ALLOCATABLE rather than automatic arrays in procedures](https://twitter.com/fortrantip/status/1473636468405030913) 6:48 AM · Dec 22, 2021 [automatic.f90](./automatic.f90)<br>

### Procedures
[Functions should be PURE and have INTENT(IN) arguments](https://twitter.com/fortrantip/status/1472603894886932482) 10:25 AM · Dec 19, 2021 [func.f90](./func.f90)<br>
[ELEMENTAL functions broadcast arguments](https://twitter.com/fortrantip/status/1472606914857078793) 10:37 AM · Dec 19, 2021 [elemental.f90](./elemental.f90)<br>
[Put functions and subroutines in modules to ensure that interfaces are checked.](https://twitter.com/fortrantip/status/1472610403884670976) 10:50 AM · Dec 19, 2021 [module.f90](./module.f90)<br>
[Demonstrate optional arguments and RANDOM_NUMBER](https://twitter.com/fortrantip/status/1472684194765672450) 3:44 PM · Dec 19, 2021 [optional.f90](./optional.f90)<br>
[Define and call a subroutine](https://twitter.com/fortrantip/status/1472692305522044932) 4:16 PM · Dec 19, 2021 [subroutine.f90](./subroutine.f90)<br>
[Subroutines can have INTENT(IN OUT) arguments, but functions should not](https://twitter.com/fortrantip/status/1472696912541364224) 4:34 PM · Dec 19, 2021 [intent_in_out.f90](./intent_in_out.f90)<br>
[Specify function and subroutine argument INTENTs](https://twitter.com/fortrantip/status/1472698233298333699) 4:39 PM · Dec 19, 2021<br>
[Procedures can be RECURSIVE](https://twitter.com/fortrantip/status/1472702427740745728) 4:56 PM · Dec 19, 2021<br>
[Returning multiple values from a subroutine or function](https://twitter.com/fortrantip/status/1476724929299197962) 8:20 PM · Dec 30, 2021 [subroutine_dt.f90](./subroutine_dt.f90)<br>
[How size of an array function result can depend on function arguments](https://twitter.com/fortrantip/status/1477606275643019269) 6:42 AM · Jan 2, 2022 [array_func.f90](./array_func.f90)<br>
[Len of character variable function result can depend on arguments](https://twitter.com/fortrantip/status/1477632693617799169) 8:27 AM · Jan 2, 2022 [join.f90](./join.f90)<br>
[Avoid implicit save](https://twitter.com/fortrantip/status/1478363292028784645) 8:50 AM · Jan 4, 2022 [implicit_save.f90](./implicit_save.f90) [run](https://onlinegdb.com/BCZzmjYxs)<br>
[Two types of syntax for defining a function](https://twitter.com/fortrantip/status/1479641195898826754) 9:28 PM · Jan 7, 2022 [function.f90](./function.f90) [function.txt](./function.txt)<br>
[Propagation of an optional argument](https://twitter.com/fortrantip/status/1479805991382360066) 8:23 AM · Jan 8, 2022 [optional_use.f90](./optional_use.f90)<br>
[UnALLOCATED variable passed to a procedure is not PRESENT there.](https://twitter.com/fortrantip/status/1480585104997163018) 11:59 AM · Jan 10, 2022<br>
[Procedures can be called with a mix of named and positional arguments.](https://twitter.com/fortrantip/status/1480893840068390913) 8:26 AM · Jan 11, 2022 [arguments.f90](./arguments.f90)<br>
[Fortran 2008 introduced IMPURE ELEMENTAL procedures](https://twitter.com/fortrantip/status/1483063464562204672) 8:07 AM · Jan 17, 2022 [impure_elemental.f90](./impure_elemental.f90)<br>
[Impure elemental procedure can be used to generate array of non-uniform variates](https://twitter.com/fortrantip/status/1483430581232967684) 8:26 AM · Jan 18, 2022 [random_normal.f90](./random_normal.f90)<br>
[Use INTRINSIC to specify that compiler-provided procedures and modules are referenced](https://twitter.com/fortrantip/status/1484517091738886147) 8:23 AM · Jan 21, 2022 [intrinsic.f90](./intrinsic.f90)<br>
[VALUE attribute for procedure arguments introduced in Fortran 2003](https://twitter.com/fortrantip/status/1484874794352918528) 8:05 AM · Jan 22, 2022 [value.f90](./value.f90)<br>
[An INTENT(OUT) argument is undefined at the beginning of a procedure](https://twitter.com/fortrantip/status/1485594671300632576) 7:45 AM · Jan 24, 2022 [intent_out_undefined.f90](./intent_out_undefined.f90)<br>
[ALLOCATABLE INTENT(OUT) argument is deallocated.](https://twitter.com/fortrantip/status/1485957543990018053) 7:47 AM · Jan 25, 2022 [intent_out_allocatable.f90](./intent_out_allocatable.f90)<br>
[Dummy argument that is changed must be definable in the caller.](https://twitter.com/fortrantip/status/1486313053092208645) 7:20 AM · Jan 26, 2022 [definable_arg.f90](./definable_arg.f90)<br>
[A procedure can have an argument that is another PROCEDURE with an INTERFACE.](https://twitter.com/fortrantip/status/1487410814919356419) 8:02 AM · Jan 29, 2022 [trapezoid.f90](./trapezoid.f90)<br>
[Fortran 2018 procedures can have assumed-rank arguments.](https://twitter.com/fortrantip/status/1496107321457528835) 7:59 AM · Feb 22, 2022 [assumed_rank.f90](./assumed_rank.f90)<br>
[Errors in a procedure can be handled with an optional argument.](https://twitter.com/fortrantip/status/1497902611915284482) 6:53 AM · Feb 27, 2022 [optional_err.f90](./optional_err.f90)<br>
[Internal procedures have access to variables from the host unless they are overridden by local variables.](https://twitter.com/fortrantip/status/1499014126265372685) 8:29 AM · Mar 2, 2022 [scope.f90](./scope.f90)<br>

### Math intrinsic functions
[Use GAMMA to compute factorials](https://twitter.com/fortrantip/status/1474357943667671060) 6:35 AM · Dec 24, 2021 [factorial.f90](./factorial.f90)<br>
[MODULO vs. MOD function](https://twitter.com/fortrantip/status/1476541936681066501) 7:13 AM · Dec 30, 2021<br>

### Modules
[USE, ONLY to avoid polluting the namespace](https://twitter.com/fortrantip/status/1472613921886552065) 11:04 AM · Dec 19, 2021<br>
[Use PARAMETERs in modules to define physical and mathematical constants](https://twitter.com/fortrantip/status/1472718436040073226) 6:00 PM · Dec 19, 2021 [module_parameter.f90](./module_parameter.f90)<br>
[Function overloading using an interface with module procedures](https://twitter.com/fortrantip/status/1472629090758836229) 12:05 PM · Dec 19, 2021 [interface.f90](./interface.f90)<br>
[Name modules and the source files containing them consistently, with one module per file.](https://twitter.com/fortrantip/status/1473340740055015431) 11:13 AM · Dec 21, 2021<br>
[Use the same name for analogous procedures defined in different modules using an INTERFACE](https://twitter.com/fortrantip/status/1481247763048407042) 7:52 AM · Jan 12, 2022 [shared_interface.f90](./shared_interface.f90)<br>
[How to rename an imported module entity](https://twitter.com/fortrantip/status/1481597325499842563) 7:01 AM · Jan 13, 2022 [rename.f90](./rename.f90)<br>
[Module entities are PUBLIC by default.](https://twitter.com/fortrantip/status/1481970740475932676) 7:45 AM · Jan 14, 2022 [private.f90](./private.f90)<br>
[An unqualified USE foo statement imports public entities defined in foo and what foo imported.](https://twitter.com/fortrantip/status/1482328990798987266) 7:29 AM · Jan 15, 2022 [imports.f90](./imports.f90)<br>
[PROTECTED module variables cannot be changed outside the module.](https://twitter.com/fortrantip/status/1484136749924245509) 7:12 AM · Jan 20, 2022 [protected.f90](./protected.f90)<br>

### Derived types
[Derived type definition, initialization, and operator overloading](https://twitter.com/fortrantip/status/1474169072665440259) 6:04 PM · Dec 23, 2021 [date.f90](./date.f90)<br>
[Store data as an array of derived types or a derived type with array components?](https://twitter.com/fortrantip/status/1475133178763427848) 9:55 AM · Dec 26, 2021 [derived_type_array.f90](./derived_type_array.f90)<br>
[A derived type can be used where a scalar is needed.](https://twitter.com/fortrantip/status/1494295438320713730) 7:59 AM · Feb 17, 2022 [elemental_func_arg.f90](./elemental_func_arg.f90)<br>
[A derived type can have derived type components.](https://twitter.com/fortrantip/status/1494651022010200065) 7:32 AM · Feb 18, 2022 [derived_type_composition.f90](./derived_type_composition.f90)<br>
[A derived type component can have a default value.](https://twitter.com/fortrantip/status/1495001410894811139) 6:44 AM · Feb 19, 2022 [type_constructor_optional.f90](./type_constructor_optional.f90)<br>
[A derived type can have PRIVATE components.](https://twitter.com/fortrantip/status/1495372934537428997) 7:21 AM · Feb 20, 2022 [dt_private.f90](./dt_private.f90)<br>

### Environment variables
[Execute_command_line() to pass a command to the shell.](https://twitter.com/fortrantip/status/1489212898777964545) 7:23 AM · Feb 3, 2022 [execute.f90](./execute.f90)<br>
[Execute_command_line() can call gnuplot to display a plot during a run.](https://twitter.com/fortrantip/status/1489580579653918729) 7:44 AM · Feb 4, 2022<br>
[Document results with compiler_version(), compiler_options(), and other intrinsics.](https://twitter.com/fortrantip/status/1489952805649588226) 8:23 AM · Feb 5, 2022 [xpi.f90](./xpi.f90)<br>
[Demonstrate subroutine get_environment_variable(name,value) of Fortran 2003.](https://twitter.com/fortrantip/status/1490329749578731530) 9:21 AM · Feb 6, 2022 [get_env.f90](./get_env.f90)<br>
[get_command() and get_command_argument() get command line arguments.](https://twitter.com/fortrantip/status/1490666160504905730) 7:38 AM · Feb 7, 2022 [get_command.f90](./get_command.f90)<br>

### Floating point arithmetic
[Call ieee_set_halting_mode() to set floating point conditions that halt program.](https://twitter.com/fortrantip/status/1487084606780325889) 10:26 AM · Jan 28, 2022 [ieee_exceptions.f90](./ieee_exceptions.f90)<br>
[IEEE_ARITHMETIC module has functions to test numerical conditions.](https://twitter.com/fortrantip/status/1486706121335263246) 9:22 AM · Jan 27, 2022 [ieee_arithmetic.f90](./ieee_arithmetic.f90)<br>

### Associate
[Associate creates an alias for expressions or variables.](https://twitter.com/fortrantip/status/1472565511628197891) 7:52 AM · Dec 19, 2021 [assoc.f90](./assoc.f90)<br>
[Pointer assignment and ASSOCIATE can create shallow copies.](https://twitter.com/fortrantip/status/1499368960151760896) 7:59 AM · Mar 3, 2022 [copy.f90](./copy.f90)<br>
[ASSOCIATE is preferred over POINTER to create an alias because POINTER can inhibit optimization.](https://twitter.com/fortrantip/status/1499720499181535247) 7:16 AM · Mar 4, 2022 [associate_vs_pointer.f90](./associate_vs_pointer.f90)<br>
[ASSOCIATE statement can set several independent variables.](https://twitter.com/fortrantip/status/1500087163668549636) 7:33 AM · Mar 5, 2022 [associate_many.f90](./associate_many.f90)<br>
[A variable ASSOCIATEd to an ALLOCATABLE variable is not ALLOCATABLE.](https://twitter.com/fortrantip/status/1500448694734364675) 7:30 AM · Mar 6, 2022 [associate_alloc.f90](./associate_alloc.f90)<br>
[Bounds of associate-name for whole array or array section selector](https://twitter.com/fortrantip/status/1500813206356430848) 7:38 AM · Mar 7, 2022 [associate_bounds.f90](./associate_bounds.f90)<br>

### Pointers
[Pointer can remap array shape and bounds.](https://twitter.com/fortrantip/status/1501169574997377025) 7:14 AM · Mar 8, 2022 [pointer_reshape.f90](./pointer_reshape.f90)<br>
[Pointer should be initialized to null() to avoid undefined association status.](https://twitter.com/fortrantip/status/1501547568307728385) 8:16 AM · Mar 9, 2022 [pointer_use.f90](./pointer_use.f90)<br>
[Use ALLOCATABLE arrays or ASSOCIATE instead of POINTER when possible.](https://twitter.com/fortrantip/status/1501898993785319429) 7:33 AM · Mar 10, 2022<br>

### Generic programming
[Unlimited polymorphic allocatable variable can be set to any type.](https://twitter.com/fortrantip/status/1496463950375960579) 7:36 AM · Feb 23, 2022 [unlimited_poly.f90](./unlimited_poly.f90)<br>
[Unlimited polymorphic pointer can point to any type.](https://twitter.com/fortrantip/status/1496470666576642048) 8:03 AM · Feb 23, 2022 [unlimited_pointer.f90](./unlimited_pointer.f90)<br>
[Assumed type arguments have no declared type.](https://twitter.com/fortrantip/status/1496825853551992843) 7:34 AM · Feb 24, 2022 [assumed_type.f90](./assumed_type.f90)<br>



