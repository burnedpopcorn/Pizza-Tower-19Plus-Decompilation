function scr_player_parry() //scr_player_parry
{
    mach2 = 0
    hsp = xscale * movespeed
    if (scr_solid((x + sign(hsp)), y) && xscale == 1 && move == 1 && (!(place_meeting((x + 1), y, obj_slope))))
        movespeed = 0
    if (scr_solid((x + sign(hsp)), y) && xscale == -1 && move == -1 && (!(place_meeting((x - 1), y, obj_slope))))
        movespeed = 0
    if (movespeed >= 0)
        movespeed = 0
    if (movespeed < 0)
        movespeed += 0.6
    if (floor(image_index) == (image_number - 1))
        state = (0 << 0)
    image_speed = 0.6
}

