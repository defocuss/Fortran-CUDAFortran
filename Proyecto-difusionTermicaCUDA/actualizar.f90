module actualizar_mod
    use cudafor 
    implicit none
contains
    ! CORRECCIÓN: "attributes(global)" (con doble T y S al final)
    attributes(global) subroutine actualizar_kernel(datos_in, datos_out)
        implicit none
        
        integer :: i,j
        real, parameter :: a = 0.1
        real, dimension(:,:), intent(in) :: datos_in
        real, dimension(:,:), intent(out) :: datos_out

        i = (blockIdx%x - 1) * blockDim%x + threadIdx%x 
        j = (blockIdx%y - 1) * blockDim%y + threadIdx%y 

        if (i >= 2 .and. i <= 99 .and. j >= 2 .and. j <= 99) then 
            datos_out(i,j) = datos_in(i,j) + a*(datos_in(i+1,j) + datos_in(i-1,j) + &
                             datos_in(i,j+1) + datos_in(i,j-1) - (4.0 * datos_in(i,j)))
        end if

    end subroutine actualizar_kernel

end module actualizar_mod