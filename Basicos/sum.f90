program name
    ! Todas las variables se deben declarar antes de usarlas
    implicit none
    real :: num1, num2, sum

    print *, 'Ingresa los dos numeros: '
    read *, num1
    read *, num2
    sum = num1 + num2
    
    print *, 'El total de la suma es', int(sum)
end program name