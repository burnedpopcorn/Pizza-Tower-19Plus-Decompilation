function scr_player_knightpep() //scr_player_knightpep
{
    collide_destructibles = function(argument0, argument1) //anon@59@scr_player_knightpep_scr_player_knightpep
    {
        if (argument1 >= 0)
            scr_destroy_vertical(argument1, (1 << 0))
        scr_destroy_horizontal(argument0)
    }

    hit_vertical = function(argument0) //anon@199@scr_player_knightpep_scr_player_knightpep
    {
        if ((sprite_index == spr_knightpepdownthrust || sprite_index == spr_knightpepfall || sprite_index == spr_knightpepdoublejump) && argument0 >= 0 && (!scr_slope()))
        {
            with (obj_baddie)
            {
                if (bbox_in_camera(1, id) && grounded && vsp > 0)
                {
                    vsp = -7
                    hsp = 0
                }
            }
            camera_shake(10, 30)
            gamepadvibrate(0.7, 0, 7)
            combo = 0
            bounce = 0
            image_index = 0
            freefallstart = 0
            momemtum = 0
            scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
            instance_create_depth(x, (y + 3), 0, obj_slamcloud)
            sprite_index = spr_knightpepland
        }
    }

    alarm[5] = 2
    alarm[7] = 60
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if (sprite_index == spr_knightpepland || sprite_index == spr_knightpepwalk || sprite_index == spr_knightpepidle)
    {
        move = input_check_opposing("left", "right")
        hsp = move * movespeed
    }
    else if (sprite_index == spr_knightpepjump || sprite_index == spr_knightpepfall || sprite_index == spr_knightpepdoublejump || sprite_index == spr_knightpepdownthrust)
    {
        hsp = xscale * movespeed
        move = input_check_opposing("left", "right")
        var _accel = 0.2
        if (move != 0)
        {
            if (move != xscale)
            {
                movespeed = Approach(movespeed, 0, _accel)
                if (movespeed <= 0)
                {
                    xscale = move
                    movespeed = 0
                }
            }
            else if (sprite_index != spr_knightpepstart)
                movespeed = Approach(movespeed, 6, _accel)
        }
    }
    else if grounded
        hsp = 0
    if ((!grounded) && input_check("groundpound") && sprite_index != spr_knightpepdownthrust)
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/knightdownthrust", x, y)
        knightdowncloud = 1
        sprite_index = spr_knightpepdownthrust
        vsp = -5
        hsp = 0
        movespeed = 0
    }
    if (sprite_index == spr_knightpepdownthrust && vsp >= 0)
    {
        if (knightdowncloud == 1 && vsp >= 4)
        {
            with (instance_create_depth(x, (y - 16), (depth + 1), obj_parryeffect))
                sprite_index = spr_knightpep_downcloud
            knightdowncloud = 0
        }
        vsp += 0.5
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (dir != xscale && grounded)
    {
        dir = xscale
        movespeed = 0
    }
    if (grounded && move != 0 && sprite_index == spr_knightpepidle)
        sprite_index = spr_knightpepwalk
    else if (grounded && move == 0 && sprite_index == spr_knightpepwalk)
        sprite_index = spr_knightpepidle
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    var dj = 1
    if (input_buffer_jump < 8 && can_jump && (sprite_index == spr_knightpepidle || sprite_index == spr_knightpepdownthrust || sprite_index == spr_knightpepland || sprite_index == spr_knightpepwalk || sprite_index == spr_knightpepfall))
    {
        instance_create_depth(x, y, 0, obj_highjumpcloud2)
        dj = 0
        input_buffer_jump = 8
        image_index = 0
        sprite_index = spr_knightpepjumpstart
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        vsp = -11
        if (move == 0)
            movespeed = 0
        if (move != 0)
            movespeed = 6
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepjumpstart)
        sprite_index = spr_knightpepjump
    if ((floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepjump) || ((!grounded) && sprite_index != spr_knightpepjumpstart && sprite_index != spr_knightpepjump && sprite_index != spr_knightpepthunder && sprite_index != spr_knightpepdownthrust && sprite_index != spr_knightpepdoublejump))
        sprite_index = spr_knightpepfall
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepland)
    {
        sprite_index = spr_knightpepidle
        knightsliding = 0
    }
    if (move != 0 && grounded)
        xscale = move
    if grounded
    {
        doublejumped = 0
        if (move != 0)
        {
            if (movespeed < 6)
                movespeed += 0.5
            else if (movespeed == 6)
                movespeed = 6
        }
        else if (sprite_index != spr_knightpepjumpstart)
            movespeed = 0
    }
    else if (knightmiddairstop == 0)
    {
        hsp = xscale * movespeed
        if ((!doublejumped) && input_buffer_jump < 8 && (!can_jump) && sprite_index != spr_knightpepdownthrust)
        {
            scr_fmod_soundeffect(char_jumpsnd, x, y)
            doublejumped = 1
            vsp = -11
            repeat (4)
            {
                with (instance_create_depth((x + (random_range(-50, 50))), (y + (random_range(0, 50))), 0, obj_highjumpcloud2))
                {
                    vspeed = 2
                    sprite_index = spr_cloudeffect
                }
            }
            sprite_index = spr_knightpepdoublejump
            image_index = 0
            move = input_check_opposing("left", "right")
            if (move != 0)
                xscale = move
            if (move != 0)
                movespeed = 6
            if (move == 0)
                movespeed = 0
        }
    }
    if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_solid) && (!scr_slope()))
        movespeed = 0
    if (move != 0 && hsp != 0 && sprite_index != spr_knightpepdoublejump)
    {
        if (movespeed < 1)
            image_speed = 0.15
        else if (movespeed > 1 && movespeed < 4)
            image_speed = 0.35
        else
            image_speed = 0.6
    }
    else
        image_speed = 0.35
    if (floor(image_index) == 4 && sprite_index == spr_knightpepstart)
        instance_create_depth(x, (y - 600), 0, obj_thunder)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepthunder)
    {
        sprite_index = spr_knightpepidle
        scr_tiptext(string_get("tips/transfo/knightpep"), "knighttip")
        if (knightspr == (2 << 0))
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/clownhonk", x, y)
        if (knightspr == (1 << 0))
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/foghorn", x, y)
    }
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_knightpepdoublejump || sprite_index == spr_knightpepstart))
        image_index = image_number - 1
    if (move != 0 && grounded && vsp > 0 && sprite_index != spr_knightpepstart && sprite_index != spr_knightpepthunder)
    {
        if (steppy > 0)
            steppy--
        else
        {
            instance_create_depth(x, (y + 43), 0, obj_cloudeffect)
            steppy = 13
            scr_fmod_soundeffectONESHOT("event:/sfx/player/step", x, y)
        }
    }
    if (sprite_index == spr_knightpepfall || sprite_index == spr_knightpepdownthrust)
        knightmomentum += 0.35
    if (scr_slope() && sprite_index != spr_knightpepthunder)
    {
        if (sprite_index == spr_knightpepdownthrust)
            movespeed = 11
        else
            movespeed = 8
        with (instance_place(x, (y + 1), obj_slope))
            other.xscale = (-sign(image_xscale))
        state = (13 << 0)
        sprite_index = spr_knightpepdownslope
        slope_buffer = 20
    }
}

