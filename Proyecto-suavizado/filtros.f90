module filtros_mod
    implicit none
    contains

    subroutine filtros (datos_in, ventana, datos_out)
        implicit none
        real, dimension(:), intent(in) :: datos_in
        integer, intent(in) :: ventana
        real, dimension(:), intent(inout) :: datos_out
        integer :: i, num_puntos
        real :: suma

        num_puntos = size(datos_in)

        datos_out = 0.0

        ! Restamos "ventana" para no salirnos de los límites del arreglo al final.
        do i = 1, num_puntos - ventana + 1
            
            ! Fortran suma todos los elementos desde i hasta (i + ventana - 1) internamente
            suma = sum(datos_in(i : i + ventana - 1))
            
            ! Calculamos el promedio y lo guardamos en la salida
            datos_out(i) = suma / real(ventana)
        end do

    end subroutine filtros

end module filtros_mod