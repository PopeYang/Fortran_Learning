program main
    use LabelLoopModule  ! use module
    implicit none

    ! call submodule
    call processLoop

    write(*,*) 'Loop completed.'
end program main