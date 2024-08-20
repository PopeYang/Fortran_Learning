program main
    !use LabelLoopModule_Goto  ! use module
    use LabelLoopModule_Re
    
    implicit none

    ! call submodule
    call processLoop

    write(*,*) 'Loop completed.'
end program main