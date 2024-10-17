function scr_player_grab() //scr_player_grab
{
    collide_destructibles = function(argument0, argument1) //anon@54@scr_player_grab_scr_player_grab
    {
        if (sprite_index == spr_swingding)
            scr_destroy_horizontal(argument0)
    }

    hit_horizontal = function(argument0) //anon@166@scr_player_grab_scr_player_grab
    {
        if (sprite_index == spr_swingding)
        {
            scr_fmod_soundeffectONESHOT("event:/sfx/player/killingblow", x, y)
            state = (103 << 0)
            sprite_index = spr_swingdingend
            image_index = 0
            vsp = -6
            movespeed = -4
            gamepadvibrate(0.8, 0, 7)
            with (instance_create_depth(x, y, 0, obj_swordhitbox))
                playerid = other.playerobj
        }
    }

    grav = 0.5
    move = input_check_opposing("left", "right")
    var swingding = sprite_index == spr_swingding
    if grounded
    {
        jumpstop = 0
        anger = 100
        if (!swingding)
        {
            if (dir != xscale)
            {
                dir = xscale
                movespeed = 2
                facehurt = 0
                armhurt = 0
                introscared = 0
            }
            hsp = move * movespeed
            if (heavy == 0)
            {
                if (move != 0)
                {
                    if (movespeed < 8)
                        movespeed += 0.5
                    else if (floor(movespeed) == 8)
                        movespeed = 8
                }
                else
                    movespeed = 0
                if (movespeed > 8)
                    movespeed -= 0.1
            }
            else
            {
                if (move != 0)
                {
                    if (movespeed < 8)
                        movespeed += 0.25
                    else if (floor(movespeed) == 8)
                        movespeed = 8
                }
                else
                    movespeed = 0
                if (movespeed > 8)
                    movespeed -= 0.1
            }
            if (move != 0)
                xscale = move
        }
        if (move != 0)
        {
            if (movespeed < 3 && move != 0)
                image_speed = 0.35
            else if (movespeed > 3 && movespeed < 6)
                image_speed = 0.45
            else
                image_speed = 0.6
        }
    }
    if (!grounded)
    {
        if (!swingding)
        {
            if (dir != xscale)
            {
                dir = xscale
                movespeed = 2
                facehurt = 0
                armhurt = 0
                introscared = 0
            }
            if (move != xscale)
                movespeed = 2
            if (!momemtum)
                hsp = move * movespeed
            else
                hsp = xscale * movespeed
            if (move != xscale && momemtum && movespeed != 0)
                movespeed -= 0.05
            if (movespeed == 0)
                momemtum = 0
            if (move != 0 && movespeed < 8)
                movespeed += 0.5
            if (movespeed > 8)
                movespeed -= 0.5
            if (move != 0)
                xscale = move
            if (scr_solid((x + xscale), y) && move == xscale)
                movespeed = 0
            if (dir != xscale)
            {
                dir = xscale
                movespeed = 2
                facehurt = 0
                armhurt = 0
                introscared = 0
            }
        }
    }
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if (grounded && input_buffer_jump < 8 && (!input_check("down")) && vsp > 0)
    {
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        sprite_index = spr_haulingjump
        instance_create_depth(x, y, 0, obj_highjumpcloud2)
        if (heavy == 0)
            vsp = -11
        else
            vsp = -6
        image_index = 0
    }
    if (move == (-xscale))
    {
        mach2 = 0
        momemtum = 0
    }
    landAnim = 1
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
    {
        vsp /= 10
        jumpstop = 1
    }
    if (ladderbuffer > 0)
        ladderbuffer--
    if (scr_solid(x, (y - 1)) && (!jumpstop) && jumpAnim)
    {
        vsp = grav
        jumpstop = 1
    }
    if (grounded && move != 0 && sprite_index == spr_haulingidle && (!swingding))
        sprite_index = spr_haulingmove
    else if (grounded && move == 0 && sprite_index == spr_haulingmove && (!swingding))
        sprite_index = spr_haulingidle
    if (sprite_index == spr_haulingstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_haulingidle
    if ((sprite_index == spr_haulingjump && floor(image_index) == (image_number - 1)) || ((!grounded) && (sprite_index == spr_haulingmove || sprite_index == spr_haulingidle)))
        sprite_index = spr_haulingfall
    if (grounded && vsp > 0 && (sprite_index == spr_haulingfall || sprite_index == spr_haulingjump))
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/player/step", x, y)
        sprite_index = spr_haulingland
    }
    if (sprite_index == spr_haulingland && floor(image_index) == (image_number - 1))
        sprite_index = spr_haulingidle
    if (swingdingbuffer > 0)
        swingdingbuffer -= 1
    if (input_buffer_attack < 8 && (!swingding))
    {
        input_buffer_attack = 8
        if (move != 0)
            move = xscale
        state = (2 << 0)
        if (!input_check("up"))
            sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
        else if input_check("up")
            sprite_index = spr_uppercutfinishingblow
        image_index = 0
    }
    if (input_check("down") && (!grounded))
    {
        sprite_index = spr_piledriver
        state = (25 << 0)
        piledrivervsp = -9
        image_index = 0
        image_speed = 0.35
        fmod_studio_event_instance_start(groundpoundfallsnd)
    }
    if ((!swingding) && grounded && move != 0 && (floor(image_index) == 2 || floor(image_index) == 8) && steppy == 0)
    {
        instance_create_depth(x, (y + 43), 0, obj_cloudeffect)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/step", x, y)
        steppy = 1
    }
    if ((!swingding) && grounded && move != 0 && floor(image_index) != 2 && floor(image_index) != 8)
        steppy = 0
    if (input_check("down") && grounded && (!swingding))
    {
        state = (43 << 0)
        landAnim = 0
        crouchAnim = 1
        image_index = 0
        idle = 0
    }
    if (!swingding)
        image_speed = 0.35
    else
        image_speed = 0.7
    if swingding
    {
        hsp = xscale * movespeed
        if grounded
            movespeed = Approach(movespeed, 0, 0.15)
        if (movespeed <= 0)
        {
            sprite_index = spr_haulingstart
            image_index = 0
        }
        if (floor(image_index) == (image_number - 1))
        {
            if (grabspin == -1)
                grabspin = 0
            if (grabspin == 0)
                grabspin = 1
        }
        if (grabspin && input_buffer_attack < 8)
        {
            input_buffer_attack = 8
            scr_fmod_soundeffectONESHOT("event:/sfx/player/killingblow", x, y)
            state = (103 << 0)
            sprite_index = spr_swingdingend
            image_index = 0
            vsp = -6
            movespeed = -4
            gamepadvibrate(0.8, 0, 7)
            with (instance_create_depth(x, y, 0, obj_swordhitbox))
                playerid = other.playerobj
        }
    }
}

