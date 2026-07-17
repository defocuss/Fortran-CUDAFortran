program loops
    implicit none
    ! Declarar las variables
    integer :: i
    
    !Loop
    do i = 0, 20
        print *, i
    end do

    ! Loop con saltos de 2
    do i = 0, 20, 2
        print *, i
    end do
end program loops