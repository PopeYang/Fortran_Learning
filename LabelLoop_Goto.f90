MODULE LABELLOOPMODULE_GOTO
    IMPLICIT NONE
    
CONTAINS
    SUBROUTINE PROCESSLOOP_GOTO
        INTEGER :: I

        ! 使用带标签的DO循环遍历数字
        DO 200 I = 1, 50
            IF (MOD(I, 10) == 0) THEN
                GOTO 300
            ENDIF
    
            IF (MOD(I, 5) == 0) THEN
                GOTO 210
            ENDIF
    
            WRITE(*,*) 'VALUE OF I: ', I
            GOTO 200
    
    210     CONTINUE
            WRITE(*,*) 'I IS A MULTIPLE OF 5: ', I
            GOTO 200
    
    300     CONTINUE
            WRITE(*,*) 'I IS A MULTIPLE OF 10: ', I
    
            ! 200 CONTINUE是循环的逻辑结构的一部分
            ! 表示循环的开始
            ! 控制流会根据循环条件在这里继续/结束循环
    200     CONTINUE  
        
    END SUBROUTINE PROCESSLOOP_GOTO
    
END MODULE LABELLOOPMODULE_GOTO