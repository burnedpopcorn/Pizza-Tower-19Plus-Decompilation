function scr_player_handstand() //scr_player_handstand
{
    move = input_check_opposing("left", "right")
    if (!(scr_solid(x, (y + 1))))
        hsp = move * movespeed
    else
        hsp = 0
    if (move == 0)
        movespeed = 0
    if (move != 0 && movespeed < 6)
        movespeed += 0.5
    if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope)))))
        movespeed = 0
    if (xscale == 1 && move == -1)
    {
        mach2 = 0
        movespeed = 0
        momemtum = 0
    }
    if (xscale == -1 && move == 1)
    {
        mach2 = 0
        momemtum = 0
        movespeed = 0
    }
    landAnim = 1
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
    {
        vsp /= 2
        jumpstop = 1
    }
    if (ladderbuffer > 0)
        ladderbuffer--
    if (scr_solid(x, (y - 1)) && (!jumpstop) && jumpAnim)
    {
        vsp = grav
        jumpstop = 1
    }
    if (scr_solid(x, (y + 1)) && vsp > 0 && input_check("dash") && momemtum && sprite_index == spr_fall)
    {
        movespeed = 9
        landAnim = 0
        state = (47 << 0)
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        if (!(place_meeting(x, y, obj_water2)))
            instance_create_depth(x, y, 0, obj_landcloud)
        freefallstart = 0
        scr_fmod_soundeffectONESHOT("event:/sfx/player/step", x, y)
    }
    if (scr_solid(x, (y + 1)) && vsp > 0 && ((!input_check("dash")) || (!momemtum)) && sprite_index == spr_fall)
    {
        if input_check("dash")
            landAnim = 0
        state = (0 << 0)
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        if (!(place_meeting(x, y, obj_water2)))
            instance_create_depth(x, y, 0, obj_landcloud)
        freefallstart = 0
        scr_fmod_soundeffectONESHOT("event:/sfx/player/step", x, y)
    }
    if (scr_solid(x, (y + 1)) && input_buffer_jump < 8 && vsp > 0 && sprite_index == spr_fall)
    {
        stompAnim = 0
        vsp = -9
        state = (36 << 0)
        jumpAnim = 1
        jumpstop = 0
        image_index = 0
        if (!(place_meeting(x, y, obj_water2)))
            instance_create_depth(x, y, 0, obj_landcloud)
        freefallstart = 0
        scr_fmod_soundeffect(char_jumpsnd, x, y)
    }
    if (sprite_index == spr_player_hanstandjump && image_index > 3 && image_index < 4 && scr_solid(x, (y + 1)))
    {
        vsp = -15
        scr_fmod_soundeffect(char_jumpsnd, x, y)
    }
    if (sprite_index == spr_player_hanstandjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_fall
    if (move != 0 && (!(scr_solid(x, (y + 1)))))
        xscale = move
    image_speed = 0.35
}

