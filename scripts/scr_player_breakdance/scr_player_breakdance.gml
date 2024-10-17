function scr_player_breakdance() //scr_player_breakdance
{
    collide_destructibles = function(argument0, argument1) //anon@60@scr_player_breakdance_scr_player_breakdance
    {
        scr_destroy_horizontal(argument0)
    }

    mach2 = 0
    move = input_check_opposing("left", "right")
    hsp = xscale * movespeed
    switch dance
    {
        case "breakdance":
            breakdancedashtime = Approach(breakdancedashtime, 0, 1)
            if grounded
            {
                movespeed = Approach(movespeed, 0, 0.2)
                if (breakdancedashtime <= 0)
                {
                    if (input_check("dash") && movespeed >= 6)
                    {
                        state = (47 << 0)
                        sprite_index = spr_mach
                    }
                    else
                        state = (0 << 0)
                }
            }
            if (input_buffer_down < 8 && grounded)
            {
                input_buffer_down = 8
                sprite_index = spr_player_breakdanceslide
                machhitAnim = 0
                state = (45 << 0)
                if (movespeed < 12)
                    movespeed = 12
                rollbuffer = 20
                fmod_studio_event_instance_start(divesnd)
            }
            if (input_check_pressed("taunt") && move == xscale)
            {
                dance = "butt"
                if (movespeed < 12)
                    movespeed = 12
                vsp = -6
                sprite_index = spr_player_buttattackstart
                image_index = 0
            }
            if (scr_solid((x + xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
            {
                state = (49 << 0)
                sprite_index = spr_player_wallsplat
                gamepadvibrate(0.4, 0, 7)
                image_index = 0
                mach2 = 0
                movespeed = 0
                scr_fmod_soundeffectONESHOT("event:/sfx/player/splat", x, y)
            }
            if (sprite_index == spr_player_breakdancestart && floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_player_breakdance
                image_index = 0
            }
            break
        case "slide":
            if (hsp != 0)
                xscale = sign(hsp)
            if (scr_slope_ext(x, (y + 1)) && vsp >= 0)
            {
                with (instance_place(x, (y + 1), obj_slope))
                {
                    var slope_acceleration = abs(image_yscale) / abs(image_xscale)
                    if (other.xscale == sign(image_xscale))
                    {
                        if (other.movespeed > 0)
                        {
                            other.movespeed -= (0.3 * slope_acceleration)
                            if (other.movespeed <= 0)
                                other.xscale = (-sign(image_xscale))
                        }
                    }
                    else if (other.xscale == (-sign(image_xscale)))
                    {
                        if (other.movespeed < 25)
                            other.movespeed += (0.3 * slope_acceleration)
                    }
                }
            }
            else if (grounded && (!(scr_solid(x, (y - 16)))))
            {
                movespeed = Approach(movespeed, 0, 0.15)
                if (movespeed <= 0)
                    state = (0 << 0)
            }
            if (input_check_pressed("down") && grounded)
            {
                movespeed = 14
                with (instance_create_depth(x, y, 0, obj_dashcloud2))
                    image_xscale = other.xscale
            }
            if (scr_solid((x + xscale), y) && (!(place_meeting((x + xscale), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
            {
                xscale *= -1
                movespeed *= 0.85
                instance_create_depth((x + 10 * xscale), (y + 10), 0, obj_bumpeffect)
            }
            if (grounded && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))) && input_check_pressed("dash"))
            {
                instance_create_depth(x, y, 0, obj_jumpdust)
                if (movespeed < 8)
                    movespeed = 8
                flash = 0
                state = (23 << 0)
            }
            sprite_index = spr_player_breakdanceslide
            break
        case "butt":
            if (movespeed < 18)
                movespeed += 0.1
            if (grounded && vsp >= 0)
            {
                if (!input_check("dash"))
                    state = (0 << 0)
                else
                {
                    state = (66 << 0)
                    sprite_index = spr_mach4
                }
            }
            assflingspeed = movespeed
            if ((!grounded) && input_buffer_down < 8)
            {
                input_buffer_down = 8
                state = (51 << 0)
                sprite_index = spr_mach2jump
                vsp = 12
                movespeed = 0
                hsp = 0
            }
            if (scr_solid((x + xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
            {
                if input_check("dash")
                {
                    if (character != "P")
                        sprite_index = spr_machclimbwall
                    else if (character == "P")
                        sprite_index = spr_player_climbwall
                    wallspeed = movespeed
                    state = (12 << 0)
                }
                else
                {
                    sprite_index = spr_hitwall
                    scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
                    scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
                    camera_shake(20, 40)
                    with (obj_baddie)
                    {
                        if (grounded && bbox_in_camera(1, id))
                        {
                            stun = 1
                            alarm[0] = 200
                            ministun = 0
                            vsp = -5
                            hsp = 0
                        }
                    }
                    hsp = 0
                    image_speed = 0.35
                    flash = 0
                    state = (49 << 0)
                    if (movespeed < 16)
                        hsp = -3 * xscale
                    if (movespeed >= 16)
                        hsp = -6 * xscale
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                    instance_create_depth((x + xscale * 10), (y + 10), 0, obj_bumpeffect)
                }
            }
            if (sprite_index == spr_player_buttattackstart && floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_player_buttattack
                image_index = 0
            }
            break
        case "slam":
            if (sprite_index == spr_player_breakdanceslamstart && floor(image_index) == (image_number - 1))
            {
                scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
                with (obj_baddie)
                {
                    if (grounded && bbox_in_camera(1, id))
                    {
                        vsp = -12
                        hsp = 0
                        state = 104
                        if (stunned < 100)
                            stunned = 100
                    }
                }
                camera_shake(10, 30)
                sprite_index = spr_player_breakdanceslamend
                image_index = 0
            }
            if (sprite_index == spr_player_breakdanceslamend && floor(image_index) == (image_number - 1))
                state = (0 << 0)
            break
    }

    image_speed = (dance != "slide" ? 0.35 : (0.02 + (abs(movespeed / 25))))
    if (dance != "slam")
    {
        if (input_check_pressed("up") && dance != "slam")
        {
            state = (75 << 0)
            sprite_index = spr_shoryukenstart
            image_index = 0
            hsp = movespeed * sign(hsp)
            shoryukenvsp = (grounded ? -14 : -6)
            canuppercut = 0
            scr_fmod_soundeffectONESHOT("event:/sfx/player/uppercut", x, y)
            with (instance_create_depth(x, y, 0, obj_highjumpcloud2))
                image_xscale = other.xscale
            jumpAnim = 1
            facehurt = 0
            armhurt = 0
            introscared = 0
        }
    }
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
}

