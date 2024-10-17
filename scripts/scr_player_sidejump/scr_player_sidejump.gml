function scr_player_sidejump() //scr_player_sidejump
{
    collide_destructibles = function(argument0, argument1) //anon@58@scr_player_sidejump_scr_player_sidejump
    {
        scr_destroy_horizontal(argument0, (1 << 0))
    }

    hit_vertical = function(argument0) //anon@150@scr_player_sidejump_scr_player_sidejump
    {
        if (argument0 < 0)
            scr_destroy_vertical(argument0)
    }

    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    hsp = xscale * movespeed
    if (movespeed < 12)
        movespeed = 12
    if (movespeed < 20)
        movespeed += 0.1
    if (movespeed >= 20)
        movespeed = 20
    if input_check("up")
        vsp = -3.5
    else if input_check("down")
        vsp = 3.5
    else if ((!input_check("down")) && (!input_check("up")))
        vsp = 0
    if input_check_pressed("dash")
    {
        state = (66 << 0)
        if grounded
        {
            with (instance_create_depth(x, y, 0, obj_dashcloud2))
                image_xscale = other.xscale
        }
        sprite_index = spr_player_dashpad
    }
    if (scr_solid((x + hsp), y) && (!(place_meeting((x + hsp), y, obj_destructibles))))
    {
        a = 0
        if (sprite_index == spr_player_supersidejump)
            sprite_index = spr_player_supersidejumpland
        camera_shake(10, 30)
        with (obj_baddie)
        {
            if bbox_in_camera(1, id)
            {
                image_index = 0
                if grounded
                    vsp = -7
            }
        }
        scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
        image_index = 0
        state = (68 << 0)
        machhitAnim = 0
    }
    if (!instance_exists(obj_chargeeffect))
        instance_create_depth(x, y, 0, obj_chargeeffect)
    if (!instance_exists(obj_mach3effect))
        instance_create_depth(x, y, 0, obj_mach3effect)
    image_speed = 0.4
}

