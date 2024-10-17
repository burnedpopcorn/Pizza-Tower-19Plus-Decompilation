if (obj_player.state == (91 << 0))
{
    with (obj_player)
    {
        image_index = 0
        if input_check("up")
        {
            state = (25 << 0)
            sprite_index = spr_piledriver
            piledrivervsp = -14
            movespeed = 0
            hsp = 0
            fmod_studio_event_instance_start(groundpoundfallsnd)
        }
        else if (!input_check("up"))
        {
            if (movespeed <= 10)
            {
                sprite_index = spr_haulingstart
                scr_fmod_soundeffectONESHOT("event:/sfx/player/grabthing", x, y)
            }
            else if (movespeed > 10)
                sprite_index = spr_swingding
            state = (28 << 0)
            if (!grounded)
                vsp = -6
        }
    }
    grabbedby = other.playerid
}
