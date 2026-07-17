program ifendif
    implicit none
    ! Declarar variables
    real :: num1, num2, respuesta
    integer :: opcion

    ! Solicitar opcion
    print *, 'Elige una opcion:'
    print *, '1. Suma'
    print *, '2. Resta'
    print *, '3. Multiplicacion'
    print *, '4. Division'
    read *, opcion

    num1 = 12
    num2 = 12

    if ( opcion == 1 ) then
        respuesta = num1 + num2
        print *, 'El valor es ', respuesta
    end if
    if ( opcion == 2 ) then
        respuesta = num1 - num2
        print *, 'El valor es ', respuesta
    end if
    if ( opcion == 3 ) then
        respuesta = num1 * num2
        print *, 'El valor es ', respuesta
    end if
    if ( opcion == 4 ) then
        respuesta = num1 / num2
        print *, 'El valor es ', respuesta
    end if

end program ifendif