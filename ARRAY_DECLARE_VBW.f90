MODULE VBW_MATRIX
    IMPLICIT NONE

CONTAINS

SUBROUTINE PRINT_MATRIX(ND, LD_BX, ABX)
    IMPLICIT NONE
    INTEGER, INTENT(IN) :: ND
    REAL*8, INTENT(IN) :: ABX(:)
    INTEGER, INTENT(IN) :: LD_BX(:)
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
    INTEGER, DIMENSION(:), INTENT(IN) :: LD_BX
    REAL*8, DIMENSION(:), INTENT(IN) :: ABX(SUM(LD_BX))
    
    INTEGER :: i, j, index, sym_index
    
    WRITE(*, *) "Symmetric matrix:"
    
    ! Print the symmetric matrix
    DO i = 1, ND
        index = SUM(LD_BX(1:i-1)) + 1  ! Start index for this row in ABX
        
        DO j = 1, ND
            IF (j <= i) THEN
                ! Print element from ABX (upper triangular part including diagonal)
                WRITE(*, '(F8.1)', advance='no') ABX(index)
                index = index + 1
            ELSE
                ! Print element from the corresponding lower triangular part
                sym_index = SUM(LD_BX(1:j-1)) + i  ! Adjusted for the symmetry
                WRITE(*, '(F8.1)', advance='no') ABX(sym_index)
            END IF
        END DO
        
        WRITE(*,*)  ! New line after each row
    END DO
END SUBROUTINE PRINT_SYMMETRIC_MATRIX




END MODULE VBW_MATRIX