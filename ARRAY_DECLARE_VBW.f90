MODULE VBW_MATRIX
    IMPLICIT NONE

CONTAINS

SUBROUTINE PRINT_MATRIX(ND, LD_BX, ABX)
    IMPLICIT NONE
    INTEGER, INTENT(IN) :: ND
    !!! HOW TO DECLARE a VARIABLE BANDWIDTH ARRAY
    INTEGER, DIMENSION(:), INTENT(IN) :: LD_BX(ND)
    REAL*8, DIMENSION(:), INTENT(INOUT) :: ABX(LD_BX(ND))
    INTEGER :: i, j, idx

    DO i = 1, ND
        DO j = 1, i
            idx = LD_BX(i) - i + j
            WRITE(*, '(F8.5)', ADVANCE='NO') ABX(idx)
        END DO
        PRINT *  ! New line after each row
    END DO
    PRINT *  ! Final new line

END SUBROUTINE PRINT_MATRIX
    
SUBROUTINE PRINT_SYMMETRIC_MATRIX(ND, LD_BX, ABX)

    IMPLICIT NONE
    INTEGER, INTENT(IN) :: ND
    !!! HOW TO DECLARE a VARIABLE BANDWIDTH ARRAY
    INTEGER, DIMENSION(:), INTENT(IN) :: LD_BX(ND)
    REAL*8, DIMENSION(:), INTENT(INOUT) :: ABX(LD_BX(ND))
    INTEGER :: i, j, idx
    REAL*8 :: FULL_MATRIX(ND, ND)
    
    ! Initialize full matrix to zero
    FULL_MATRIX = 0.0
    
    ! Fill lower triangle based on variable bandwidth
    DO i = 1, ND
        DO j = 1, i
            idx = LD_BX(i) - i + j
            FULL_MATRIX(i, j) = ABX(idx)
            IF (i /= j) FULL_MATRIX(j, i) = ABX(idx)  ! Symmetric for upper triangle
        END DO
    END DO
    
    ! Print the full matrix
    PRINT *, "Full Matrix:"
    DO i = 1, ND
        DO j = 1, ND
            WRITE(*, '(F8.3)', ADVANCE='NO') FULL_MATRIX(i, j)
        END DO
        PRINT *
    END DO

END SUBROUTINE PRINT_SYMMETRIC_MATRIX




END MODULE VBW_MATRIX