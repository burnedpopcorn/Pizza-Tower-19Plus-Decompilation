with (obj_player)
{
    if (place_meeting(x, (y + 1), obj_tomatoblock) && state != (33 << 0))
    {
        vsp = -15
        with (instance_place(x, (y + 1), obj_tomatoblock))
        {
            image_index = 0
            image_speed = 0.35
        }
    }
}
