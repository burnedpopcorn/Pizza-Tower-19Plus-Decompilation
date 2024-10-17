function scr_player_freefallprep() //scr_player_freefallprep
{
    move = input_check_opposing("left", "right")
    if (!grounded)
    {
        hsp = move * movespeed
        if (move != xscale && momemtum && movespeed != 0)
            movespeed -= 0.05
        if (movespeed == 0)
            momemtum = 0
        if ((move == 0 && (!momemtum)) || scr_solid((x + hsp), y))
        {
            movespeed = 0
            mach2 = 0
        }
        if (move != 0 && movespeed < 7)
            movespeed += 0.25
        if (movespeed > 7)
            movespeed -= 0.05
        if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
            movespeed = 0
        if (dir != xscale)
        {
            mach2 = 0
            dir = xscale
            movespeed = 0
        }
        if (move == (-xscale))
        {
            mach2 = 0
            movespeed = 0
            momemtum = 0
        }
        if (move != 0)
            xscale = move
    }
    if (character != "S")
        image_speed = 0.4
    else
        image_speed = 1
    if (floor(image_index) == (image_number - 1) || vsp > 3)
    {
        state = (51 << 0)
        if (global.currentpowerup != (1 << 0))
            sprite_index = spr_bodyslamfall
        else
            sprite_index = spr_shotgunjump3
    }
}

