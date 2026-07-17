program variables
    ! Declarar variables
    character (len=20):: name

    ! Pedir que ingrese el nombre
    print *, "Ingresa tu nombre:"

    ! Leer lo que ingreso
    read *, name
    
    ! Imprimir lo que ingreso
    print *, "Hola, ", trim(name)

    end program variables