module LabelLoopModule
    implicit none
    
contains
    subroutine processLoop
        integer :: i

        ! ʹ�ô���ǩ��DOѭ����������
        do 200 i = 1, 10
            if (mod(i, 5) == 0) then
                goto 210
            endif

            write(*,*) 'Value of i: ', i
            goto 200
            
210         continue
            write(*,*) 'i is a multiple of 5: ', i
            
200     continue  ! ���Ǳ��Ϊ200���У�ѭ��������ᵽ������
        
    end subroutine processLoop
    
end module LabelLoopModule