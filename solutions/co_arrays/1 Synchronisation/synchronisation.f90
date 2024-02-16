program synchronisation
    implicit none
    ! Int Skalar Coarray und Counter für den do-loop deklarieren
    integer :: data[*]
    integer :: i 


    ! Falls wir uns im zweiten Image befinden, pausieren wir dieses, um zu simulieren, dass es zu lange braucht
    if (this_image() == 2) then
        call sleep(1)
    end if


    ! Initialisieren des Coarrays mit dem quadrierten Index des Images
    data[this_image()] = this_image()**2


    ! Ausgabe wenn das Image fertig mit der Zuweisung des Coarray ist
    print *, "Image", this_image(), "finished executing"
    

    ! Synchronisation aller Iages
    sync all


    ! Schleife zur Ausgabe der Werte des Coarrays
    if (this_image() == 1) then
        do i=1, num_images() 
            print *, "Image ", i, ": ", data[i]
        end do
    end if

end program synchronisation