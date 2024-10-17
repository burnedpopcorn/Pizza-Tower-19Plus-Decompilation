function scr_player_boxxedpep() //scr_player_boxxedpep
{
    collide_destructibles = function(argument0, argument1) //anon@59@scr_player_boxxedpep_scr_player_boxxedpep
    {
        if (sprite_index == spr_boxxeddash || boxxedslide)
            scr_destroy_horizontal(argument0, (224 << 0), (16 << 0))
    }

    mask_index = spr_crouchmask
    key_particles = 0
    if (vsp > 0)
        vsp -= 0.25
    if (movespeed >= 10)
        blurafterimageeffect(3, 0.05)
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if ((!input_check("jump")) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    if (sprite_index != spr_boxxedintro)
    {
        hsp = xscale * movespeed
        move = input_check_opposing("left", "right")
        var conveyorLok = (sign(movespeed) > 8 || (move != 0 && move == sign(hsp)))
        movespeed = clamp((movespeed + conveyor * 10), (-((8 + 6 * conveyorLok))), (8 + 6 * conveyorLok))
    }
    if (scr_solid((x + sign(hsp)), y) && xscale == 1 && move == 1 && (!(place_meeting((x + 1), y, obj_slope))) && (!(place_meeting((x + 1), y, obj_destructibles))) && (!(place_meeting((x + 1), y, obj_ratblock))))
        movespeed = 0
    if (scr_solid((x + sign(hsp)), y) && xscale == -1 && move == -1 && (!(place_meeting((x - 1), y, obj_slope))) && (!(place_meeting((x - 1), y, obj_destructibles))) && (!(place_meeting((x - 1), y, obj_ratblock))))
        movespeed = 0
    if ((grounded || coyotetime > 0) && input_buffer_jump < 8 && vsp >= 0 && (!(scr_solid(x, (y - 16)))))
    {
        coyotetime = 0
        grounded = false
        image_index = 0
        jumpAnim = 1
        vsp = -11
        boxxedslide = 0
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        instance_create_depth(x, y, 0, obj_highjumpcloud2)
    }
    if (grounded && vsp > 0 && sprite_index != spr_boxxedintro && (!boxxedslide))
    {
        if (sprite_index == spr_boxxedpep_jump || sprite_index == spr_boxxedpep_air)
        {
            instance_create_depth(x, y, 0, obj_landcloud)
            scr_fmod_soundeffectONESHOT("event:/sfx/player/step", x, y)
        }
        jumpAnim = 0
    }
    if (!boxxedslide)
    {
        if grounded
        {
            if (move != 0)
            {
                if (movespeed < 8)
                    movespeed = min((movespeed + 0.4), 8)
            }
            else if (!(place_meeting(x, (y + 1), [obj_railh, obj_railh2])))
                movespeed = lerp(movespeed, 0, 0.4)
        }
        else if (move != 0)
        {
            if (movespeed < 8)
                movespeed += 0.6
        }
        else
            movespeed = lerp(movespeed, 0, 0.2)
    }
    if (sprite_index == spr_boxxedintro && floor(image_index) == (image_number - 1))
        sprite_index = spr_boxxedidle
    if (sprite_index == spr_boxxedpep_kick && floor(image_index) == (image_number - 1))
        sprite_index = spr_boxxedidle
    if (sprite_index != spr_boxxedintro)
    {
        if (move != 0 && (!boxxedslide))
            xscale = move
        if grounded
        {
            boxxeddoublejump = 0
            boxxeddoublejumpanim = 0
            if (move != 0 && (!boxxedslide))
            {
                if (sprite_index != spr_boxxedpep_kick)
                {
                    if (movespeed < 10)
                        sprite_index = spr_boxxedwalk
                    else if (movespeed >= 10)
                    {
                        sprite_index = spr_boxxeddash
                        if (input_check("down") && (!boxxedslide))
                        {
                            boxxedslide = 1
                            sprite_index = spr_boxxedslide
                        }
                    }
                }
                if (instance_exists(obj_bomb) && place_meeting((x + hsp), y, obj_bomb))
                {
                    with (instance_place((x + hsp), y, obj_bomb))
                    {
                        if (!kicked)
                        {
                            vsp = -7
                            hsp = 16 * other.xscale
                            scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", other.x, other.y)
                            scr_fmod_soundeffectONESHOT("event:/sfx/enemy/punched", other.x, other.y)
                            other.sprite_index = spr_boxxedpep_kick
                            other.image_index = 0
                            kicked = 1
                        }
                    }
                }
            }
            else if (sprite_index != spr_boxxedpep_kick && (!boxxedslide))
                sprite_index = spr_boxxedidle
            if scr_slope_ext(x, (y + 1))
            {
                if (xscale == (-(sign(instance_place(x, (y + 1), obj_slope).image_xscale))))
                {
                    if (vsp >= 0 && input_check("down"))
                    {
                        boxxedslide = 1
                        sprite_index = spr_boxxedslide
                        if (movespeed < 6)
                            movespeed = 6
                    }
                }
            }
            if boxxedslide
            {
                if (scr_slope_ext(x, (y + 1)) && vsp >= 0)
                {
                    with (instance_place(x, (y + 1), obj_slope))
                    {
                        var slope_acceleration = abs(image_yscale) / abs(image_xscale)
                        if (other.xscale == sign(image_xscale))
                        {
                            if (other.movespeed > 0)
                                other.movespeed -= (0.2 * slope_acceleration)
                        }
                        else if (other.xscale == (-sign(image_xscale)))
                        {
                            if (other.movespeed < 20)
                                other.movespeed += (0.6 * slope_acceleration)
                        }
                    }
                }
                if (!(scr_slope_ext(x, (y + 1))))
                {
                    sprite_index = spr_boxxedslide
                    movespeed = Approach(movespeed, 0, 0.1)
                    if (movespeed <= 0)
                        boxxedslide = 0
                }
                else if (xscale == (-(sign(instance_place(x, (y + 1), obj_slope).image_xscale))))
                    sprite_index = spr_boxxedslidedown
                else
                    sprite_index = spr_boxxedslide
                if (!input_check("down"))
                    boxxedslide = 0
            }
        }
        else if ((!grounded) && vsp != 0 && (!boxxedslide) && (!boxxeddoublejump))
        {
            if (!jumpAnim)
                sprite_index = spr_boxxedair
        }
        if (!grounded)
        {
            if ((!boxxeddoublejump) && input_check_pressed("jump"))
            {
                boxxeddoublejump = 1
                boxxeddoublejumpanim = 1
                image_index = 0
                sprite_index = spr_boxxeddoublejump
                vsp = -12
            }
        }
    }
    if boxxeddoublejumpanim
    {
        if (!grounded)
        {
            if (vsp > 0)
                sprite_index = spr_boxxeddoublejumpfall
        }
    }
    if (jumpAnim && (!boxxeddoublejumpanim))
    {
        sprite_index = spr_boxxedjump
        if (floor(image_index) == (image_number - 1))
            jumpAnim = 0
    }
    if (!jumpAnim)
    {
        if (sprite_index == spr_boxxedjump)
            sprite_index = spr_boxxedair
    }
    image_speed = 0.35
}

