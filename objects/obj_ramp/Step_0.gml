visible = 1
with (obj_player)
{
    if ((!(place_meeting(x, y, other))) && other.glist[id] && grounded && movespeed >= 8 && xscale == other.image_xscale && (state == (47 << 0) || state == (66 << 0)))
    {
        if (state != (95 << 0) && state != (26 << 0))
        {
            sprite_index = spr_player_rampjump
            image_index = 0
            state = (95 << 0)
            scr_tiptext(string_get("tips/other/ramp"), "ramptip")
            instance_destroy(obj_trickpoints)
            vsp = -13
            movespeed = 12
            with (instance_create_depth(x, y, 0, obj_shoulderbashcrazyrunothereffect))
                image_xscale = other.xscale
            scr_fmod_soundeffectONESHOT("event:/sfx/player/ramp", x, y)
            if (ds_list_find_index(global.saveroom, other.id) == -1)
            {
                ds_list_add(global.saveroom, other.id)
                rampdotricks = 1
            }
        }
        else if (state == (26 << 0))
        {
            vsp = -13
            if (movespeed < 14)
                movespeed = 14
            with (instance_create_depth(x, y, 0, obj_shoulderbashcrazyrunothereffect))
                image_xscale = other.xscale
            scr_fmod_soundeffectONESHOT("event:/sfx/player/ramp", x, y)
        }
    }
    other.glist[id] = (place_meeting(x, y, other) && grounded)
}
