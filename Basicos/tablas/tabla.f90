program tabla
    implicit none
    
    ! Construir una tabla de z=x*y para x=1 al 4 y y=1 al 6

    ! Declarar las variables
    integer :: x, y, z
    
    ! Se le asigna un identificador al archivo de salida
    open(10, file='tabla.txt')
    print *, '        x.       y.        z.'
    write(10, *) '        x.       y.        z.'

    do x=1,4 
        do y=1,6
            z=x*y
            print *, x, y, z
            write(10, *) x, y, z
        end do
    end do
end program tabla