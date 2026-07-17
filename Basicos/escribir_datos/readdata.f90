program readdata
    implicit none
    ! Declarar las variables

    real :: x, y, z
    
    ! Main
    ! Se abre el archivo de datos
    open(10, file='data.txt')

    ! Se lee el archivo de datos
    read(10, *) x, y, z

    ! Se imprimne los datos que se encuentran en el archivo
    print *, 'Los valores leídos son: ', x, y, z
    
end program readdata