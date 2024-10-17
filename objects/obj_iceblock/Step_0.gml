if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (state == (18 << 0) || state == (115 << 0))
        {
            state = (13 << 0)
            if (movespeed < 13)
                movespeed = 13
        }
        else if (state != (13 << 0) && state != (38 << 0) && state != (87 << 0))
        {
            state = (38 << 0)
            sprite_index = spr_slipnslide
            scr_fmod_soundeffectONESHOT("event:/sfx/misc/slip", x, y)
        }
    }
}
