function scr_player_slipbanan() //scr_player_slipbanan
{
    collide_destructibles = function(argument0, argument1) //anon@59@scr_player_slipbanan_scr_player_slipbanan
    {
        if (argument1 < 0)
            scr_destroy_vertical(argument1, (1 << 0))
        scr_destroy_horizontal(argument0)
    }

    hit_vertical = function(argument0) //anon@194@scr_player_slipbanan_scr_player_slipbanan
    {
        if ((!(place_meeting(x, (y + 1), obj_current))) && argument0 > 0 && sprite_index != spr_slipbanan3)
        {
            if (!slipbounce)
            {
                slipbounce = 1
                scr_fmod_soundeffectONESHOT("event:/sfx/misc/impact", x, y)
                sprite_index = spr_slipbananimpact
                image_index = 0
                vsp = -5
                movespeed /= 2
                instance_create_depth(x, y, 0, obj_landcloud)
                gamepadvibrate(0.4, 0, 7)
            }
            else
            {
                scr_fmod_soundeffectONESHOT("event:/sfx/misc/cymbalcrash", x, y)
                sprite_index = spr_slipbanan3
                image_index = 0
                instance_create_depth(x, y, 0, obj_landcloud)
                gamepadvibrate(0.4, 0, 7)
            }
        }
    }

    hit_horizontal = function(argument0) //anon@884@scr_player_slipbanan_scr_player_slipbanan
    {
        instance_create_depth((x + xscale * 10), (y + 10), 0, obj_bumpeffect)
        instance_create_depth((x + xscale * 4), y, 0, obj_bangeffect)
        xscale *= -1
        slipbounce = 1
        if (!grounded)
            sprite_index = spr_slipbananimpact
        scr_fmod_soundeffectONESHOT("event:/sfx/misc/impact", x, y)
        gamepadvibrate(0.4, 0, 7)
    }

    hsp = xscale * movespeed
    if (sprite_index == spr_slipbanan1 && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_slipbanan2
        image_index = 0
    }
    if (sprite_index == spr_slipbanan1 || sprite_index == spr_slipbanan2)
    {
        if currentslip
        {
            if scr_slope_ext((x + sign(hsp)), (y + 1))
            {
                with (instance_place((x + sign(hsp)), y, obj_slope))
                {
                    var slope_angle = abs(image_yscale) / abs(image_xscale)
                    with (other.id)
                    {
                        vsp = (-((15 * slope_angle)))
                        movespeed = 8
                    }
                }
            }
        }
    }
    if (sprite_index == spr_slipbanan3)
    {
        if (grounded && scr_slope_ext(x, (y + 1)) && vsp >= 0)
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
                    if (other.movespeed < 12)
                        other.movespeed += (0.3 * slope_acceleration)
                }
            }
        }
        else
            movespeed = Approach(movespeed, 0, 0.4)
        if (floor(image_index) == (image_number - 1))
        {
            if (movespeed == 0 && grounded)
                state = (0 << 0)
            else
                image_index = image_number - 1
        }
    }
    image_speed = 0.35
}

