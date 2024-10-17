function scr_player_faceplant() //scr_player_faceplant
{
    collide_destructibles = function(argument0, argument1) //anon@59@scr_player_faceplant_scr_player_faceplant
    {
        scr_destroy_horizontal(argument0)
    }

    hsp = xscale * movespeed
    move = input_check_opposing("left", "right")
    if (movespeed < 11)
        movespeed += 0.1
    if (character != "N")
        image_speed = 0.42
    if (character == "N")
        image_speed = 0.35
    if (input_check("down") && grounded && vsp > 0)
    {
        grav = 0.5
        sprite_index = spr_crouchslip
        machhitAnim = 0
        state = (45 << 0)
        movespeed = 12
    }
    if (scr_solid((x + xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        sprite_index = spr_hitwall
        scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
        camera_shake(20, 40)
        hsp = 0
        image_speed = 0.35
        with (obj_baddie)
        {
            if bbox_in_camera(1, id)
            {
                stun = 1
                alarm[0] = 200
                ministun = 0
                vsp = -5
                hsp = 0
            }
        }
        flash = 0
        state = (49 << 0)
        hsp = -2.5 * xscale
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create_depth((x + 10 * xscale), (y + 10), 0, obj_bumpeffect)
    }
    if (floor(image_index) == (image_number - 1) && (!input_check("dash")))
    {
        image_speed = 0.35
        state = (0 << 0)
        grav = 0.5
    }
    if (floor(image_index) == (image_number - 1) && input_check("dash"))
    {
        image_speed = 0.35
        state = (47 << 0)
        grav = 0.5
    }
    if ((!instance_exists(obj_dashcloud)) && grounded)
    {
        with (instance_create_depth(x, y, 0, obj_dashcloud))
            image_xscale = other.xscale
    }
}

