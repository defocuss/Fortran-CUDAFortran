program main
    use actualizar_mod
    implicit none
    
    ! Declaracion de variables
    real, dimension(:,:), allocatable :: T_actual, T_nueva
    integer :: i,j

    allocate(T_actual(100,100)) ! Se le asigna un tamano de 100x100 a la matriz cuadrada
    allocate(T_nueva(100,100)) ! Se le asigna un tamano de 100x100 a la matriz cuadrada

    T_actual = 0.0 ! Se inicializa la variable

    do j = 1, 100 ! Recordar que los indices de matrices en fortran parten de 1
        do i = 1, 100
            T_actual(i,j) = 20 ! Se rellenan todos los valores de la matriz en 20
        end do
    end do

    do j = 46, 55
        do i = 46, 55
            T_actual(i,j) = 100 ! Se actualizan los valores centrales de 10x10 a 100
        end do
    end do
    
    ! Se actualizan los valores de las esquinas a cero
    T_actual(1,1) = 0
    T_actual(100,100) = 0
    T_actual(1,100) = 0
    T_actual(100,1) = 0

    ! Actualizar los valores simulando la propagacion
    do i = 1, 500
        call actualizar(T_actual,T_nueva)
        T_actual = T_nueva
    end do

    ! Escribir los nuevos datos
    open(10, file='p_calor.txt', status='replace', action='write')

    do i = 1, 100
        write(10,'(100(f10.4,1x))') (T_actual(i,j), j = 1, 100)
    end do

    print *, 'Los datos se han escrito en el archivo p_calor.txt'

    close(10)   

end program main