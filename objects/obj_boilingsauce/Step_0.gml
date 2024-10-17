if (place_meeting(x, (y - 1), obj_player) && obj_player.state != (33 << 0) && obj_player.state != (96 << 0))
{
    with (instance_place(x, (y - 1), obj_player))
    {
        if (state == (18 << 0) || state == (13 << 0))
        {
            flash = 1
            scr_fmod_soundeffectONESHOT("event:/sfx/player/transfo/detransfo", x, y)
            for (var i = 0; i < 5; i += 1)
            {
                with (instance_create_depth(x, y, -1, obj_knightdebris))
                    image_index = i
            }
        }
        if (state != (4 << 0))
            push_notif((5 << 0), [other.id])
        state = (4 << 0)
        vsp = -25
        sprite_index = spr_fireass
        if ((!event_isplaying(PfireassVA)) && character == "P")
            fmod_studio_event_instance_start(PfireassVA)
        if ((!event_isplaying(NfireassVA)) && character == "N")
            fmod_studio_event_instance_start(NfireassVA)
        scr_fmod_soundeffectONESHOT("event:/sfx/misc/firesound", x, y)
    }
}
