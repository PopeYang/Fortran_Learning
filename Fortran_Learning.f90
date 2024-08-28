PROGRAM MAIN
    USE LabelLoopModule_Goto  ! use module
    USE LabelLoopModule_Re
    USE TYPE_CONVERSION
    USE beam_stiffness_matrix_module

    IMPLICIT NONE

    ! Call submodule
    
    ! Label_Loop
    ! CALL PROCESSLOOP 
    ! WRITE(*,*) 'Loop completed.'
    
    ! Data_Type_Convert
    ! CALL CONVERT_AND_DISPLAY
    
    double precision, allocatable, dimension(:,:) :: stiffness_matrix
    ! 调用模块中的函数来计算刚度矩阵
    stiffness_matrix = compute_stiffness_matrix()
    print *, 'Stiffness matrix size: ', size(stiffness_matrix, 1), size(stiffness_matrix, 2)
    call save_matrix_to_file(stiffness_matrix, n)
    
END PROGRAM MAIN