module LabelLoopModule_Goto
    implicit none
    
contains
    subroutine processLoop
        integer :: i

        ! ʹ�ô���ǩ��DOѭ����������
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
    
            ! 200 continue��ѭ�����߼��ṹ��һ����
            ! ��ʾѭ���Ŀ�ʼ
            ! �����������ѭ���������������/����ѭ��
    200     continue  
        
    end subroutine processLoop
    
end module LabelLoopModule_Goto