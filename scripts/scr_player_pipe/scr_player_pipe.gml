function scr_player_pipe() //scr_player_pipe
{
    sprite_index = spr_emptyplayer
    movespeed = 0
    x += hsp
    y += vsp
    if (!instance_exists(pipe))
        pipe = -1
    if (pipedir == "hold")
    {
        if (pipe != -1)
        {
            x = lerp(x, (pipe.x + 32), 0.2)
            y = lerp(y, (pipe.y + 32), 0.2)
        }
    }
    if (pipedir == "right")
    {
        xscale = 1
        hsp = 18
        vsp = 0
    }
    if (pipedir == "left")
    {
        xscale = -1
        hsp = -18
        vsp = 0
    }
    if (pipedir == "up")
    {
        hsp = 0
        vsp = -18
    }
    if (pipedir == "down")
    {
        hsp = 0
        vsp = 18
    }
    restore_combo()
}

