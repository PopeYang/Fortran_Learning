module LabelLoopModule
    implicit none
    
contains
    subroutine processLoop
        integer :: i

        ! 使用带标签的DO循环遍历数字
        do 200 i = 1, 10
            if (mod(i, 5) == 0) then
                goto 210
            endif

            write(*,*) 'Value of i: ', i
            goto 200
            
210         continue
            write(*,*) 'i is a multiple of 5: ', i
            
200     continue  ! 这是编号为200的行，循环结束后会到达这里
        
    end subroutine processLoop
    
end module LabelLoopModule