program nachbarn
    implicit none
    ! Deklaration der Variablen
    real :: rand_num[*], neighbour_sum[*]
    integer :: left[*], right[*], i


    ! Zufallsvariable generieren
    call random_number(rand_num)


    ! Den linken Nachbarn berechnen, falls das erste Image, dann ist der linke Nachbar das letzte Image
    if (this_image() == 1) then
        left = num_images()
    else
        left = this_image() - 1
    end if


    ! Den rechten Nachbarn berechnen, falls das letze Image, dann ist der rechte Nachbar das erste Image
    if (this_image() == num_images()) then
        right = 1
    else
        right = this_image() + 1
    end if


    ! Die Summe aus benachbarten Werten berechnen
    neighbour_sum = rand_num[left] + rand_num[right]


    ! Synchronisation der Images
    sync all


    ! Ausgabe des Ergebnisses
    if (this_image()==1) then
        do i=1, num_images()
            print *, "Image", i
            print *, "Nachbarn", left[i], right[i]
            print *, "Zufallsvariable links", rand_num[left[i]], "rechts", rand_num[right[i]]
            print *, "Summe", neighbour_sum[i]
            print *, ""
        end do
    end if

    
    ! Alternative Ausgabe mit weniger Coarrays
    ! print *, "Image", this_image()
    ! print *, "Nachbarn", left, right
    ! print *, "Zufallsvariable links", rand_num[left], "rechts", rand_num[right]
    ! print *, "Summe", neighbour_sum
    ! print *, ""

end program nachbarn