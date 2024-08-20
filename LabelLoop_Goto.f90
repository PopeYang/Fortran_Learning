module LabelLoopModule_Goto
    implicit none
    
contains
    subroutine processLoop
        integer :: i

        ! 使用带标签的DO循环遍历数字
        do 200 i = 1, 50
            if (mod(i, 10) == 0) then
                goto 300
            endif
    
            if (mod(i, 5) == 0) then
                goto 210
            endif
    
            write(*,*) 'Value of i: ', i
            goto 200
    
    210     continue
            write(*,*) 'i is a multiple of 5: ', i
            goto 200
    
    300     continue
            write(*,*) 'i is a multiple of 10: ', i
    
            ! 200 continue是循环的逻辑结构的一部分
            ! 表示循环的开始
            ! 控制流会根据循环条件在这里继续/结束循环
    200     continue  
        
    end subroutine processLoop
    
end module LabelLoopModule_Goto