if (state != 107)
{
    sprite_index = stunfallspr
    instance_destroy()
    with (obj_player)
    {
        do_hitstun(global.otherimpactfulhitstun)
        camera_shake(3, 3)
        with (obj_drawcontroller)
            alarm[4] = 15
    }
}
