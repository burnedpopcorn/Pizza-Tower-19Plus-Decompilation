function scr_player_climbwall() //scr_player_climbwall
{
    collide_destructibles = function(argument0, argument1) //anon@60@scr_player_climbwall_scr_player_climbwall
    {
        if (argument1 < 0)
            scr_destroy_vertical(argument1)
    }

    step_vertical = function(argument0) //anon@148@scr_player_climbwall_scr_player_climbwall
    {
        if (state != (47 << 0) && wallspeed > 0 && (!(scr_solid_player((x + xscale), y))))
        {
            instance_create_depth(x, y, 0, obj_jumpdust)
            vsp = 0
            wallspeed = max(wallspeed, 6)
            if (wallspeed >= 6 && wallspeed < 12)
            {
                state = (47 << 0)
                movespeed = wallspeed
            }
            else
            {
                if (character != "S")
                {
                    state = (66 << 0)
                    sprite_index = spr_mach4
                }
                else if (!snickmach3mode)
                {
                    state = (47 << 0)
                    sprite_index = spr_mach
                }
                else
                {
                    state = (66 << 0)
                    sprite_index = spr_mach4
                }
                movespeed = wallspeed
            }
            hsp = movespeed * xscale
            return false;
        }
        return true;
    }

    hit_vertical = function(argument0) //anon@932@scr_player_climbwall_scr_player_climbwall
    {
        sprite_index = spr_superjumpland
        scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
        image_index = 0
        state = (68 << 0)
        machhitAnim = 0
        wallclimbtime = 0
        gamepadvibrate(0.4, 0, 7)
    }

    sprite_index = (character == "P" ? spr_player_climbwallmax : spr_machclimbwall)
    if (windingAnim < 200)
        windingAnim++
    move = input_check_opposing("left", "right")
    suplexmove = 0
    if input_check_pressed("jump")
        input_buffer_jump = 0
    vsp = (-wallspeed)
    if (wallspeed < 20)
        wallspeed += 0.15
    if (movespeed >= 18)
        movespeed += 0.4
    else if (movespeed < 18)
        movespeed += 0.2
    crouchslideAnim = 1
    cangrab = 1
    if (wallclimbtime > 0)
        wallclimbtime--
    if ((!input_check("dash")) && wallclimbtime == 0)
    {
        state = (0 << 0)
        movespeed = 0
        additionalhsp = -8 * xscale
    }
    if (wallspeed < 0)
    {
        if (!(scr_solid((x + xscale), (y + 50))))
            vsp = 0
    }
    if (wallspeed < 0 && scr_solid(x, (y + 12)))
        wallspeed = 0
    if (input_buffer_jump < 8)
    {
        input_buffer_jump = 8
        wallclimbtime = 10
        image_index = 0
        jumpstop = 0
        scr_fmod_soundeffect(char_jumpsnd, x, y)
        state = (47 << 0)
        sprite_index = spr_walljumpstart
        movespeed = 10
        vsp = -11
        xscale *= -1
    }
    if (grounded && wallspeed <= 0)
    {
        state = (0 << 0)
        jumpstop = 1
    }
    image_speed = wallspeed / 20
    if (steppy > 0)
        steppy--
    else
    {
        steppy = 10
        instance_create_depth(x, (y + 43), 0, obj_cloudeffect)
    }
}

