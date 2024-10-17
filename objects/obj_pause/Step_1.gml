if ((!instance_exists(obj_endlevelfade)) && (!instance_exists(obj_endtutorialfade)) && (!instance_exists(obj_optionsmenu)) && (!instance_exists(obj_cowboytasks)) && input_check_pressed("pause") && (!(asset_has_tags(room, "No Pause", 3))))
{
    selected = 0
    if pause
    {
        scr_pause_activate_objects()
        pause_unpause_music()
        event_stop(pausemusicID, true)
    }
    else
    {
        pause = true
        obj_drawcontroller.copyapp = true
        with (obj_music)
        {
            if (global.music != noone)
            {
                if (global.music.event != -4)
                {
                    other.savedmusicpause = fmod_studio_event_instance_get_paused(global.music.event)
                    fmod_studio_event_instance_set_paused(global.music.event, true)
                }
                if (global.music.eventsecret != -4)
                {
                    other.savedsecretpause = fmod_studio_event_instance_get_paused(global.music.eventsecret)
                    fmod_studio_event_instance_set_paused(global.music.eventsecret, true)
                }
            }
            other.savedpanicpause = fmod_studio_event_instance_get_paused(panicmusicID)
            fmod_studio_event_instance_set_paused(panicmusicID, true)
        }
    }
}
