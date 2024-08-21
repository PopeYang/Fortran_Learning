MODULE TYPE_CONVERSION
    IMPLICIT NONE
    REAL :: singleVal
    DOUBLE PRECISION :: doubleVal
    INTEGER :: intVal

    CONTAINS

    SUBROUTINE CONVERT_AND_DISPLAY()
    
        intVal = 10
        singleVal = 3.14159
        
        singleVal = REAL(intVal)
        doubleVal = DBLE(singleVal)

        PRINT *, 'ORIGINAL INTEGER VALUE:', intVal
        PRINT *, 'CONVERTED TO SINGLE PRECISION:', singleVal
        PRINT *, 'CONVERTED TO DOUBLE PRECISION:', doubleVal
        
        singleVal = 3.14159
        doubleVal = DBLE(singleVal)
        PRINT *, 'ORIGINAL SINGLE PRECISION:', singleVal
        PRINT *, 'CONVERTED TO DOUBLE PRECISION:', doubleVal

        doubleVal = 2.718281828459045D0
        singleVal = REAL(doubleVal)
        PRINT *, 'ORIGINAL DOUBLE PRECISION:', doubleVal
        PRINT *, 'CONVERTED TO SINGLE PRECISION:', singleVal
        
    END SUBROUTINE CONVERT_AND_DISPLAY

END MODULE TYPE_CONVERSION