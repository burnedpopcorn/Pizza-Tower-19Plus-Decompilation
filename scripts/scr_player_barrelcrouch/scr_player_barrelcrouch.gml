function scr_player_barrelcrouch() //scr_player_barrelcrouch
{
    mask_index = spr_player_mask
    hsp = 0
    if (vsp < 12)
        vsp += grav
    if (grounded && (!input_check("down")) && image_speed == 0)
    {
        state = (61 << 0)
        movespeed = 3
        image_index = 0
    }
    sprite_index = spr_player_barrelcrouch
    if (floor(image_index) == (image_number - 1))
        image_speed = 0
    else
        image_speed = 0.35
}

