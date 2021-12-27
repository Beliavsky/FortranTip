! A doubled delimiter in a string without any embedded intervening
! blanks is regarded as a single character of the constant.
program doubled_delim

    implicit none
    character(:), allocatable :: string

    string = 'Isn''t it a nice day?'
    print *, string ! prints: Isn't it a nice day?

    string = """color"" is more common in the US than the alternative ""colour""."
    print *, string ! prints: "color" is more common in the US than the alternative "colour".

end program doubled_delim

