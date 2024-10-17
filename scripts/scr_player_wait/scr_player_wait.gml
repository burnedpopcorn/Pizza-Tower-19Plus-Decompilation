function scr_player_wait() //scr_player_wait
{
    move = (-keyboard_check(ord("A"))) + keyboard_check(ord("D"))
    if (global.waiting == 1)
    {
        hsp = 0
        movespeed = 0
        sprite_index = spr_idle
    }
    if (global.waiting == 0)
    {
        state = (0 << 0)
        hsp = 0
        movespeed = 0
    }
}

