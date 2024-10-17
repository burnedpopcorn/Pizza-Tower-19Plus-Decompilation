if (other.y > other.yprevious && other.state != (31 << 0) && other.state != (27 << 0) && other.state != (49 << 0) && other.y < y && (!scr_transformationcheck()))
{
    with (other)
    {
        while check_slope_player(obj_grindrailslope)
            y--
    }
    if (other.movespeed < 10)
        other.movespeed = 10
    other.state = (27 << 0)
    other.sprite_index = other.spr_grind
}
