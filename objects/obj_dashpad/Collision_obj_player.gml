with (other.id)
{
    if (state != (66 << 0) && state != (78 << 0) && sprite_index != spr_player_catched)
    {
        if (state == (18 << 0) || state == (13 << 0))
        {
            for (var i = 0; i < 5; i += 1)
            {
                with (instance_create_depth(x, y, -1, obj_knightdebris))
                    image_index = i
            }
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/detransfo", x, y)
        }
        if (state == (19 << 0))
            instance_create_depth(x, y, 0, obj_bombexplosion)
        if (state == (11 << 0))
        {
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/detransfo", x, y)
            for (i = 0; i < 4; i++)
            {
                with (instance_create_depth(x, y, -1, obj_boxxeddebris))
                    image_index = i
            }
        }
        xscale = other.image_xscale
        machhitAnim = 0
        state = (66 << 0)
        if (sprite_index != spr_Dashpad)
        {
            sprite_index = spr_Dashpad
            instance_create_depth(x, y, 0, obj_jumpdust)
        }
        image_index = 0
        movespeed = 12
        y = other.y - 15
        vsp = 0
        dashpadbuffer = 15
        scr_fmod_soundeffectONESHOT("event:/sfx/player/dashpad", x, y)
    }
    if (state == (66 << 0) || state == (23 << 0) || state == (40 << 0) || state == (12 << 0))
    {
        if (state != (66 << 0))
            state = (66 << 0)
        if (sprite_index != spr_Dashpad && sprite_index != spr_crazyrun)
        {
            sprite_index = spr_Dashpad
            image_index = 0
            instance_create_depth(x, y, 0, obj_jumpdust)
        }
        xscale = other.image_xscale
        if (dashpadbuffer == 0)
        {
            dashpadbuffer = 15
            scr_fmod_soundeffectONESHOT("event:/sfx/player/dashpad", x, y)
            movespeed += 1
            y = other.y - 15
            vsp = 0
        }
    }
}
