function scr_player_RETROdeath() //scr_player_RETROdeath
{
    sprite_index = spr_smalldead
    global.smallpep = true
    if (fmod_studio_event_instance_get_timeline_position(mariodeathid) < 0.5)
        vsp = -6
    else
    {
        y += vsp
        if (vsp < 20)
            vsp += 0.5
    }
}

