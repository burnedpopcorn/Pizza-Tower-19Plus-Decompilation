function scr_player_chainsawbump() //scr_player_chainsawbump
{
    movespeed = 0
    mach2 = 0
    start_running = 1
    alarm[4] = 14
    if (grounded && vsp > 0)
        hsp = 0
    if (floor(image_index) == (image_number - 1))
        state = (0 << 0)
    sprite_index = spr_player_chainsawbumpwall
    image_speed = 0.35
}

