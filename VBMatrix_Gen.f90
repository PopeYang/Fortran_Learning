
module beam_stiffness_matrix_module
    implicit none
    integer, parameter :: n = 100
    double precision, parameter :: L = 10.0d3
    double precision, parameter :: E = 210d6
    double precision, parameter :: I = 1.0d0
    
contains

    function compute_stiffness_matrix() result(matrix)
        double precision, dimension(n,n) :: matrix
        double precision :: segment_length, k
        integer :: i

        segment_length = L / (n - 1)
        matrix = 0.0d0

        do i = 2, n - 1
            k = (12d0 * E * I) / (segment_length ** 3)
            call fill_stiffness_elements(matrix, i, k)
        enddo

        call apply_boundary_conditions(matrix)
    end function compute_stiffness_matrix

    subroutine fill_stiffness_elements(matrix, i, k)
        double precision, dimension(n,n), intent(inout) :: matrix
        integer, intent(in) :: i
        double precision, intent(in) :: k

        matrix(i, i) = 6d0 * k
        matrix(i - 1, i - 1) = 4d0 * k
        matrix(i + 1, i + 1) = 4d0 * k
        matrix(i - 1, i) = -k
        matrix(i, i - 1) = -k
        matrix(i, i + 1) = -k
        matrix(i + 1, i) = -k
    end subroutine fill_stiffness_elements

    subroutine apply_boundary_conditions(matrix)
        double precision, dimension(n,n), intent(inout) :: matrix

        matrix(1, :) = 0.0d0
        matrix(:, 1) = 0.0d0
        matrix(n, :) = 0.0d0
        matrix(:, n) = 0.0d0
        matrix(1, 1) = 1.0d8  ! Simulate simply supported ends
        matrix(n, n) = 1.0d8
        
    end subroutine apply_boundary_conditions

    subroutine save_matrix_to_file(matrix, n)
        double precision, dimension(n,n), intent(in) :: matrix
        integer, intent(in) :: n
        integer :: i, j
        open(unit=10, file='stiffness_matrix.txt', status='replace')
        do i = 1, n
            do j = 1, n
                write(10, '(ES15.8)') matrix(i,j)
            enddo
            write(10, *)  ! New line for each row
        enddo
        close(10)
    end subroutine save_matrix_to_file

end module beam_stiffness_matrix_module