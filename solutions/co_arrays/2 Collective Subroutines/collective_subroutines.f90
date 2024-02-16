program collective_beispiele
    implicit none
    ! Deklarationen der Variablen
    real :: vec(3)[*]
    real, dimension(3) :: vec_sum, vec_min, vec_max
    real, allocatable, dimension(:) :: big_vec
    integer :: i


    ! Allokiere Speicher für big_vec
    allocate(big_vec(num_images()*size(vec)))


    ! Initialisierung mit zufälligen Werten
    call random_number(vec)

    
    ! Ausgabe der Werte in vec
    print *, "Image", this_image(), vec
    
    
    ! Werte von vec den Variablen zuweisen, mit denen gerechnet werden muss
    vec_sum = vec
    vec_min = vec
    vec_max = vec


    ! Jedes Image berechnet co_sum, co_min, co_max des Vektors
    call co_sum(vec_sum)
    call co_min(vec_min)
    call co_max(vec_max)


    ! Ausgabe der Ergebnisse auf Image 1
    if (this_image() == 1) then
        print *, "sum", vec_sum
        print *, "min", vec_min
        print *, "max", vec_max
    end if


    ! Auf Image 1 big_vec erstellen
    if (this_image() == 1) then
        do i=1, num_images()
            big_vec(size(vec)*(i-1)+1:size(vec)*i) = vec(:)[i]
        end do
    end if


    ! co_broadcast des big_vec
    call co_broadcast(big_vec, 1)


    ! Ausgabe des big_vec
    print *, "image", this_image(), "big_vec", big_vec


    ! Deallokieren der Vektoren
    deallocate(big_vec)

end program collective_beispiele