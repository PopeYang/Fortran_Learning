module LabelLoopModule_Re
    implicit none
    
contains
    subroutine processLoop
        integer :: i

        do i = 1, 50
            ! check if i is a multiple of 10
            if (mod(i, 10) == 0) then
                write(*,*) 'i is a multiple of 10: ', i
                cycle  ! terminate the current iteration and proceed to the next iteration of the loop
            endif

            ! check if i is a multiple of 5
            if (mod(i, 5) == 0) then
                write(*,*) 'i is a multiple of 5: ', i
                cycle
            endif

            ! write i
            write(*,*) 'Value of i: ', i
        enddo
        
    end subroutine processLoop
    
end module LabelLoopModule_Re