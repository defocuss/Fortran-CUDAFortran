program main
    use filtros_mod
    implicit none

    real, dimension(:), allocatable :: a, b ! Array para almacenar los datos ruidosos y limpios
    integer :: n, i
    character(len=40) :: cmd

    cmd = "wc -l < datos_ruidosos.txt > conteo.txt" ! Cuenta las lineas en el archivo y escribe el numero en otro
    call system(cmd)

    open(10, file='conteo.txt')
    read(10, *) n
    print *, 'El número de datos ruidosos es: ', n

    allocate(a(n), b(n))

    open(11, file='datos_ruidosos.txt')
    do i = 1, n
        read(11, *) a(i)
    end do
    close(11)

    call filtros(a, 15, b)

    open(10, file='datos_limpios.txt')
    do i = 1, n
        write(10, *) b(i)
    end do
    close(10)

end program main