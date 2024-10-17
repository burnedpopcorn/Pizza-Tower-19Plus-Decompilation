function scr_player_barrelslipnslide() //scr_player_barrelslipnslide
{
    mask_index = spr_player_mask
    hsp = xscale * movespeed
    if (movespeed <= 9)
        movespeed += 0.3
    if (vsp < 12)
        vsp += grav
    sprite_index = spr_player_barrelslipnslide
    if (floor(image_index) == (image_number - 1))
    {
        state = (63 << 0)
        flash = 1
    }
    else
        image_speed = 0.35
}

