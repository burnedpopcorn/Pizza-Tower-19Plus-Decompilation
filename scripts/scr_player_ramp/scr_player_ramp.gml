function scr_player_ramp() //scr_player_ramp
{
    collide_destructibles = function(argument0, argument1) //anon@54@scr_player_ramp_scr_player_ramp
    {
        scr_destroy_horizontal(argument0)
    }

    hsp = xscale * movespeed
    if (sprite_index == spr_player_rampjump && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_player_rampjumploop
        image_speed = 0
    }
    var _spr = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
    var _check = (sprite_index == spr_supertaunt1 || sprite_index == spr_supertaunt2 || sprite_index == spr_supertaunt3 || sprite_index == spr_supertaunt4)
    if (input_check("taunt") && (!_check) && rampdotricks)
    {
        scr_fmod_soundeffect(tricksnd, x, y)
        fmod_studio_event_instance_set_parameter_by_name(tricksnd, "state", ramptricks, true)
        if (ramptricks < 10)
            ramptricks++
        if (!instance_exists(obj_trickpoints))
            instance_create_depth(x, y, (depth - 5), obj_trickpoints)
        rampprevspr = sprite_index
        rampprevframe = image_index
        sprite_index = _spr
        image_index = 0
        repeat (12)
        {
            with (instance_create_depth((x + (random_range(-8, 8))), (y + (random_range(-8, 8))), (depth - 1), obj_confetti))
            {
                vsp = random_range(-8, -2)
                hsp = (random_range(-8, 8)) + other.movespeed * other.xscale
            }
        }
    }
    if (_check && floor(image_index) == (image_number - 1))
    {
        sprite_index = rampprevspr
        image_index = rampprevframe
    }
    if (grounded && vsp > 0)
    {
        if input_check("dash")
        {
            state = (66 << 0)
            sprite_index = spr_mach4
        }
        else
        {
            longjumpslideanim = 1
            longjumpspd = movespeed * xscale
            sprite_index = spr_longjumpslidestart
            state = (45 << 0)
            rollbuffer = 0
        }
    }
    if (scr_solid((x + xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (!grounded))
    {
        sprite_index = spr_hitwall
        scr_fmod_soundeffectONESHOT("event:/sfx/player/groundpound", x, y)
        scr_fmod_soundeffectONESHOT("event:/sfx/player/bump", x, y)
        gamepadvibrate(1, 0, 20)
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
    if (!_check)
        image_speed = 0.35
    else
        image_speed = 0.6
}

