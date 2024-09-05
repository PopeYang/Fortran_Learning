PROGRAM Main
    USE ISO_FORTRAN_ENV, ONLY : REAL64
    USE LabelLoopModule_Goto  ! Use modules for specific functionalities
    USE LabelLoopModule_Re
    USE TYPE_CONVERSION
    USE VBW_MATRIX

    IMPLICIT NONE

    INTEGER :: choice
    
    INTEGER, PARAMETER :: ND = 6
    INTEGER :: LD_BX(ND)
    REAL(REAL64), ALLOCATABLE :: ABX(:)
    INTEGER :: total_size, i

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
    CASE (2)
        ! Data_Type_Convert
        CALL CONVERT_AND_DISPLAY
    case (3)
        ! ARRAY_DECLARE_VBW

        ! Initialize LD_BX
        LD_BX = (/1, 3, 6, 10, 15, 21/)  ! This means the first row has 1 element, second has 2, third has 3

        ! Calculate total size and allocate ABX
        total_size = SUM(LD_BX)
        !!! HOW TO DECLARE a VARIABLE BANDWIDTH ARRAY
        ALLOCATE(ABX(total_size))

        ! Initialize ABX
    ABX = (/4.0, &
            1.0, 5.0, &
            1.0, 2.0, 6.0, &
            1.0, 2.0, 3.0, 7.0, &
            1.0, 2.0, 3.0, 4.0, 8.0, &
            1.0, 2.0, 3.0, 4.0, 5.0, 9.0/)

        CALL PRINT_MATRIX(ND, LD_BX, ABX)

        CALL PRINT_SYMMETRIC_MATRIX(ND, LD_BX, ABX)

        ! Clean up
        DEALLOCATE(ABX)

        END SELECT

END PROGRAM Main
