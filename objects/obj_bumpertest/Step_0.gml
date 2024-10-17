with (obj_player)
{
    if place_meeting(x, y, other.id)
    {
        hsp = 10 * (cos(instance_place(x, y, other.id)))
        vsp = 10 * (-(sin(instance_place(x, y, other.id))))
        sprite_index = spr_tumble
        state = (90 << 0)
    }
}
