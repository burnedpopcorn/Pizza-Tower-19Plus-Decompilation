if hubeject
{
    with (obj_player)
    {
        targetDoor = "HUB"
        state = (125 << 0)
        x = backtohubstartx
        y = backtohubstarty
        with (obj_drawcontroller)
            self.update_camera()
        x = backtohubstartx
        y = camera_get_view_y(view_camera[1]) - 100
        update_object_coordinates()
    }
    hubeject = false
}
