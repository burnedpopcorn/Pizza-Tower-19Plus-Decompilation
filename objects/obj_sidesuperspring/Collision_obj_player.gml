with (other.id)
{
    if (state == (47 << 0) || state == (66 << 0) || state == (1 << 0) || state == (64 << 0) || state == (23 << 0) || state == (38 << 0) || state == (105 << 0) || (state == (18 << 0) && knightsliding == 1) || state == (13 << 0) || state == (8 << 0))
    {
        other.sprite_index = spr_sidespring_bounce
        other.image_index = 0
        if (xscale != other.image_xscale)
            xscale = other.image_xscale
        if (movespeed < 10)
            movespeed = 10
    }
}
