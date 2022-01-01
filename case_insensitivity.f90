! Tweeted here: https://twitter.com/fortrantip/status/1477230568781795334
! "Fortran used to be written entirely in UPPERCASE,
! but is now case insensitive. However, whilst the
! following example is completely valid, to ensure 
! legibility it's highly recommended to choose a case
! convention and stick to it!"
program case_insensitivity
    implicit NONE

    character(len=15) :: HNY = "Happy New Year!"
    INTEGER :: this_year = 2022
    print *, hny            ! >>> Happy New Year!
    pRiNt *, ThIs_YeAr      ! >>> 2022

END PROGRAM
