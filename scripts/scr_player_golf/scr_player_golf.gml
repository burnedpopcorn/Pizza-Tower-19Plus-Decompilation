function scr_player_golf() //scr_player_golf
{
    if (sprite_index == spr_golfhit && floor(image_index) == (image_number - 1))
        state = (0 << 0)
    movespeed = 0
    hsp = 0
    image_speed = 0.35
    restore_combo()
}

