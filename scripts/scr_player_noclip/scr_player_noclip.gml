function scr_player_noclip() //scr_player_noclip
{
    hsp = 0
    vsp = 0
    sprite_index = spr_idle
    if input_check("left")
        x -= (5 + 5 * input_check("dash"))
    else if input_check("right")
        x += (5 + 5 * input_check("dash"))
    if input_check("up")
        y -= (5 + 5 * input_check("dash"))
    else if input_check("down")
        y += (5 + 5 * input_check("dash"))
    if input_check_pressed("attack")
    {
        suplexmove = 1
        fmod_studio_event_instance_start(suplexdashsnd)
        state = (16 << 0)
        image_index = 0
        if (global.currentpowerup != (1 << 0))
            sprite_index = spr_suplexdash
        else
            sprite_index = spr_shotgunsuplexdash
        movespeed = 10
        facehurt = 0
        armhurt = 0
        introscared = 0
        momemtum = 1
    }
}

