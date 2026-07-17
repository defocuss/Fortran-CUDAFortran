module actualizar_mod
    implicit none
    
contains
    subroutine actualizar (datos_in, datos_out)
        implicit none
    
        ! Declarar variables
        integer :: i,j
        real :: a
        real, dimension(:,:), intent(in) :: datos_in
        real, dimension(:,:), intent(out) :: datos_out

        a = 0.1
        datos_out = 0.0

        do j = 2, 99
            do i = 2, 99
                ! Formula de Metodo de diferencias finitas
                datos_out(i,j) = datos_in(i,j) + a*(datos_in(i+1,j) + datos_in(i-1,j) + datos_in(i,j+1) + datos_in(i,j-1) - (4 * datos_in(i,j)))
            end do
        end do

    end subroutine

end module actualizar_mod