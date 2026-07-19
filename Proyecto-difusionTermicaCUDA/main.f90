program main
    use actualizar_mod
    use cudafor
    implicit none
    
    integer, parameter :: n = 100
    real, dimension(:,:), allocatable :: T_actual, T_nueva
    real, device, dimension(:,:), allocatable :: T_actual_d, T_nueva_d
    integer :: i, j, paso
    
    ! CORRECCIÓN: Usamos dim3 para estructurar la GPU en 2D
    type(dim3) :: dimGrid, dimBlock 

    allocate(T_actual(n,n), T_nueva(n,n), T_actual_d(n,n), T_nueva_d(n,n))

    ! Inicialización CPU
    T_actual = 20.0 

    do j = 46, 55
        do i = 46, 55
            T_actual(i,j) = 100.0 
        end do
    end do
    
    T_actual(1,:) = 0.0
    T_actual(n,:) = 0.0
    T_actual(:,1) = 0.0
    T_actual(:,n) = 0.0

    T_nueva = T_actual 

    ! Transferencia Host -> Device
    T_actual_d = T_actual 
    T_nueva_d  = T_nueva 

    ! CORRECCIÓN: Configuración de la topología 2D de CUDA
    ! 10 hilos x 10 hilos por bloque = 100 hilos por bloque
    dimBlock = dim3(10, 10, 1) 
    ! 10 bloques x 10 bloques = 100x100 hilos totales, cubre toda la matriz
    dimGrid = dim3(10, 10, 1)  

    ! Bucle temporal (usamos "paso" para no pisar las variables "i, j")
    do paso = 1, 500
        call actualizar_kernel<<<dimGrid, dimBlock>>>(T_actual_d, T_nueva_d) 
        T_actual_d = T_nueva_d
    end do

    ! Transferencia Device -> Host
    T_actual = T_actual_d 

    ! Escribir los nuevos datos
    open(10, file='p_calor.txt', status='replace', action='write')
    do i = 1, 100
        write(10,'(100(f10.4,1x))') (T_actual(i,j), j = 1, 100)
    end do
    close(10)

    print *, 'Simulación paralela en GPU finalizada. Datos escritos.'

    deallocate(T_actual, T_nueva, T_actual_d, T_nueva_d)

end program main