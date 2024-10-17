function scr_player_heropep() //scr_player_heropep
{
    move = input_check_opposing("left", "right")
    hsp = xscale * movespeed
    if (sprite_index == spr_heropep_idle || sprite_index == spr_heropep_fall || sprite_index == spr_heropep_walk)
    {
        if (move != 0)
        {
            if (movespeed < 8)
                movespeed += 0.8
            if (movespeed > 8)
                movespeed -= 0.1
            if (xscale != move)
                xscale = move
        }
        if (move == 0)
            movespeed = 0
    }
    if (grounded && sprite_index != spr_heropep_groundpound && sprite_index != spr_heropep_bounce)
    {
        if (move == 0)
            sprite_index = spr_heropep_idle
        if (move != 0)
            sprite_index = spr_heropep_walk
    }
    else
    {
        if (sprite_index != spr_heropep_groundpound && sprite_index != spr_heropep_fly && sprite_index != spr_heropep_bounce)
            sprite_index = spr_heropep_fall
        if (input_check_pressed("down") && sprite_index != spr_heropep_fly && sprite_index != spr_heropep_groundpound && sprite_index != spr_heropep_bounce)
        {
            sprite_index = spr_heropep_groundpound
            vsp = 12
            movespeed = 0
        }
    }
    if (input_check_pressed("attack") && sprite_index != spr_heropep_fly && sprite_index != spr_heropep_groundpound && sprite_index != spr_heropep_bounce)
    {
        sprite_index = spr_heropep_fly
        movespeed = 12
    }
    if (sprite_index == spr_heropep_fly)
    {
        if input_check("up")
            vsp = -4
        else if input_check("down")
            vsp = 4
        else if ((!input_check("down")) && (!input_check("up")))
            vsp = 0
        if (movespeed < 24)
        {
            if (move != 0)
                movespeed += 0.1
            if (movespeed > 24)
                movespeed -= 0.1
        }
        if (movespeed > 12)
        {
            if (move == 0)
                movespeed -= 0.2
        }
        if input_check_pressed("jump")
        {
            sprite_index = spr_heropep_fall
            vsp = -8
        }
        if place_meeting((x + xscale), y, obj_solid)
        {
            sprite_index = spr_heropep_bounce
            vsp = -6
            movespeed = -8
            camera_shake(10, 30)
        }
    }
    if (sprite_index == spr_heropep_groundpound && grounded && vsp > 0)
    {
        sprite_index = spr_heropep_bounce
        vsp = -7
        camera_shake(10, 30)
    }
    if (sprite_index != spr_heropep_bounce && sprite_index != spr_heropep_groundpound && sprite_index != spr_heropep_fly)
    {
        if input_check_pressed("jump")
            input_buffer_jump = 0
        if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
        {
            vsp /= 2
            jumpstop = 1
        }
        if (grounded && vsp > 0)
            jumpstop = 0
        if (input_buffer_jump < 8 && grounded)
        {
            scr_fmod_soundeffect(char_jumpsnd, x, y)
            vsp = -12
        }
    }
    if (sprite_index == spr_heropep_fall && grounded && vsp > 0)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/step", x, y)
    if (sprite_index == spr_heropep_bounce && grounded && vsp > 0)
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/player/step", x, y)
        sprite_index = spr_heropep_idle
    }
}

