if (place_meeting(x, y, obj_player) && obj_player.state != (99 << 0))
{
    with (obj_player)
    {
        state = (99 << 0)
        sprite_index = spr_heropep_idle
        image_index = 0
    }
}
