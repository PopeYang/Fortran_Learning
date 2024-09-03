PROGRAM Main
    USE ISO_FORTRAN_ENV, ONLY : REAL64
    USE LabelLoopModule_Goto  ! Use modules for specific functionalities
    USE LabelLoopModule_Re
    USE TYPE_CONVERSION

    IMPLICIT NONE

    INTEGER :: choice

    ! Interactive choice
    PRINT *, "Select an option:"
    PRINT *, "1 - Process Loop"
    PRINT *, "2 - Convert Data Types"
    PRINT *, "3 - "
    PRINT *, "Enter choice:"
    READ *, choice

    SELECT CASE (choice)
    CASE (1)
        ! Label_Loop
        CALL PROCESSLOOP_GOTO 
        WRITE(*,*) 'Loop completed.'
        CALL PROCESSLOOP_GOTO 
        WRITE(*,*) 'Loop completed.'
    CASE (2)
        ! Data_Type_Convert
        CALL CONVERT_AND_DISPLAY

        END SELECT

END PROGRAM Main
