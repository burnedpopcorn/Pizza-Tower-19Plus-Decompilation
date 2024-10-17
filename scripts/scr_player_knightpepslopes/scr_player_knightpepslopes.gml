function scr_player_knightpepslopes() //scr_player_knightpepslopes
{
    collide_destructibles = function(argument0, argument1) //anon@65@scr_player_knightpepslopes_scr_player_knightpepslopes
    {
        scr_destroy_horizontal(argument0, (17 << 0))
    }

    hit_horizontal = function(argument0) //anon@177@scr_player_knightpepslopes_scr_player_knightpepslopes
    {
        instance_create_depth((x + xscale * 40), y, 0, obj_bumpeffect)
        movespeed = 0
        vsp = -6
        grounded = false
        sprite_index = spr_knightpepbump
        image_index = floor(image_number - 1)
        state = (115 << 0)
        gamepadvibrate(0.4, 0, 7)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
        push_notif((6 << 0), [argument0])
    }

    alarm[5] = 2
    alarm[7] = 60
    if ((x + hsp) == xprevious)
        slope_buffer--
    else
        slope_buffer = 20
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if (knightmiddairstop == 0)
        hsp = xscale * movespeed
    image_speed = 0.35
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if ((!scr_slope()) && grounded)
    {
        sprite_index = spr_knightpepcharge
        doublejumped = 0
    }
    if (vsp > 0)
    {
        if scr_slope()
        {
            sprite_index = spr_knightpepdownslope
            with (instance_place(x, (y + 1), obj_slope))
            {
                if (sign(image_xscale) == other.xscale)
                    other.sprite_index = other.spr_knightpepupslope
            }
        }
    }
    if (input_buffer_jump < 8)
    {
        if (can_jump || (!doublejumped))
        {
            scr_fmod_soundeffect(char_jumpsnd, x, y)
            vsp = -11
            sprite_index = spr_knightpepjumpslidestart
            image_index = 0
            input_buffer_jump = 8
            if (!can_jump)
            {
                repeat (4)
                {
                    with (instance_create_depth((x + (random_range(-50, 50))), (y + (random_range(0, 50))), (depth + 1), obj_highjumpcloud2))
                    {
                        vspeed = 2
                        sprite_index = spr_cloudeffect
                    }
                }
                vsp = -11
                doublejumped = 1
                sprite_index = spr_knightpepdoublejump
            }
            if (!doublejumped)
                instance_create_depth(x, y, 0, obj_highjumpcloud2)
        }
    }
    if (sprite_index != spr_knightpepjumpslidestart && sprite_index != spr_knightpepjumpslide && sprite_index != spr_knightpepdoublejump && sprite_index != spr_knightpepjump && (!grounded))
        sprite_index = spr_knightpepjumpslidestart
    if ((sprite_index == spr_knightpepdoublejump || (sprite_index == spr_knightpepjumpslidestart && character != "N")) && floor(image_index) == (image_number - 1))
        image_index = image_number - 1
    if (sprite_index == spr_knightpepjumpslidestart && character == "N" && floor(image_index) == (image_number - 1))
        sprite_index = spr_knightpepjumpslide
    if scr_slope()
    {
        with (instance_place(x, (y + 1), obj_slope))
        {
            if (other.xscale == (-sign(image_xscale)))
            {
                if (other.movespeed < 14)
                    other.movespeed += 0.25
            }
        }
    }
    if ((!grounded) && input_check("groundpound") && sprite_index != spr_knightpepdownthrust)
    {
        scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/knightdownthrust", x, y)
        knightdowncloud = 1
        sprite_index = spr_knightpepdownthrust
        vsp = -5
        hsp = 0
        movespeed = 0
        doublejumped = 0
        state = (18 << 0)
    }
}

