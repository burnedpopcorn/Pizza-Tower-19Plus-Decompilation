function scr_player_kungfu() //scr_player_kungfu
{
    collide_destructibles = function(argument0, argument1) //anon@57@scr_player_kungfu_scr_player_kungfu
    {
        scr_destroy_horizontal(argument0)
    }

    hit_horizontal = function(argument0) //anon@130@scr_player_kungfu_scr_player_kungfu
    {
        if (sign(argument0) != xscale)
            return;
        if scr_bump_rat(argument0)
            return;
        scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
        grav = 0.5
        movespeed = -6
        vsp = -8
        mach2 = 0
        image_index = 0
        machslideAnim = 1
        machhitAnim = 0
        instance_create_depth((x - 10), (y + 10), 0, obj_bumpeffect)
        sprite_index = spr_kungfubump
        gamepadvibrate(0.4, 0, 7)
        momemtum = 0
        bumped = 0
        flash = 1
    }

    landAnim = 0
    hsp = xscale * movespeed
    move = input_check_opposing("left", "right")
    dir = xscale
    if (sprite_index == spr_kungfu1 || sprite_index == spr_kungfu2 || sprite_index == spr_kungfu3)
    {
        if (move != xscale && move != 0)
        {
            if (movespeed > 1)
                movespeed -= 0.8
        }
        if (move == xscale && move != 0)
        {
            if (movespeed < 10)
                movespeed += 0.5
        }
        if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
        {
            vsp /= 10
            jumpstop = 1
        }
        if (floor(image_index) == (image_number - 1) && (!input_check("dash")))
        {
            image_speed = 0.35
            state = (0 << 0)
            grav = 0.5
            if (movespeed < 0)
                movespeed = 0
        }
        if (floor(image_index) == (image_number - 1) && input_check("dash"))
        {
            image_speed = 0.35
            state = (47 << 0)
            grav = 0.5
        }
        if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
        {
            with (instance_create_depth(x, y, 0, obj_slidecloud))
                image_xscale = other.xscale
        }
        if (!grounded)
        {
            sprite_index = choose(spr_kungfuair1start, spr_kungfuair2start, spr_kungfuair3start)
            image_index = 0
        }
        if input_check_pressed("jump")
            input_buffer_jump = 0
        if (input_buffer_jump < 8 && (can_jump || coyotetime > 0) && grounded && vsp >= 0)
        {
            state = (47 << 0)
            input_buffer_jump = 8
            grounded = false
            coyotetime = 0
            image_index = 0
            sprite_index = spr_mach2jump
            scr_fmod_soundeffect(char_jumpsnd, x, y)
            instance_create_depth(x, y, 0, obj_highjumpcloud2)
            vsp = -6
        }
        image_speed = 0.35
    }
    else if (sprite_index == spr_kungfuair1 || sprite_index == spr_kungfuair2 || sprite_index == spr_kungfuair3 || sprite_index == spr_kungfuair1start || sprite_index == spr_kungfuair2start || sprite_index == spr_kungfuair3start)
    {
        if (move != xscale && move != 0)
        {
            if (movespeed > -7)
                movespeed -= 1
        }
        if (move == xscale && move != 0)
        {
            if (movespeed < 10)
                movespeed += 0.5
        }
        if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
        {
            vsp /= 10
            jumpstop = 1
        }
        if (((!input_check("dash")) && grounded && vsp >= 0) || (input_check("dash") && grounded && vsp >= 0 && movespeed < 0))
        {
            image_speed = 0.35
            state = (0 << 0)
            grav = 0.5
            if (movespeed < 0)
                movespeed = 0
        }
        if (input_check("dash") && grounded && vsp >= 0 && movespeed > 0)
        {
            image_speed = 0.35
            state = (47 << 0)
            grav = 0.5
        }
        image_speed = 0.35
    }
    else if (sprite_index == spr_kungfubump)
    {
        landAnim = 0
        hsp = xscale * movespeed
        if (movespeed < 0)
            movespeed += 0.2
        if (movespeed > 0)
            movespeed = 0
        if (grounded && vsp > 0)
        {
            image_speed = 0.35
            state = (0 << 0)
            grav = 0.5
        }
        image_speed = 0.35
    }
    if (floor(image_index) == (image_number - 1))
    {
        image_index = 0
        if (sprite_index == spr_kungfuair1start)
            sprite_index = spr_kungfuair1
        if (sprite_index == spr_kungfuair2start)
            sprite_index = spr_kungfuair2
        if (sprite_index == spr_kungfuair3start)
            sprite_index = spr_kungfuair3
    }
    if (sprite_index != spr_kungfubump)
    {
        if (!instance_exists(obj_attackhitbox))
        {
            with (instance_create_depth(x, y, 0, obj_attackhitbox))
            {
                sprite_index = spr_player_kungfuhitbox
                playerid = other.id
                image_xscale = other.id.xscale
            }
        }
    }
}

