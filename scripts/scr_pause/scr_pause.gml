function pause_unpause_music() //pause_unpause_music
{
    with (obj_music)
    {
        if (global.music != noone)
        {
            if (global.music.event != -4)
                fmod_studio_event_instance_set_paused(global.music.event, other.savedmusicpause)
            if (global.music.eventsecret != -4)
                fmod_studio_event_instance_set_paused(global.music.eventsecret, other.savedsecretpause)
        }
        fmod_studio_event_instance_set_paused(panicmusicID, other.savedpanicpause)
    }
    event_stop(pausemusicID, true)
}

function scr_pause_activate_objects(argument0) //scr_pause_activate_objects
{
    if (argument0 == undefined)
        argument0 = true
    if argument0
        event_pause_all(false)
    instance_activate_all()
    with (obj_drawcontroller)
    {
        copyapp = false
        for (var i = 0; i < 12; i++)
            alarm[i] = hold_alarm[i]
        hold_image_speed = image_speed
    }
    fadein = 0
    pause = false
}

function scr_pause_deactivate_objects(argument0) //scr_pause_deactivate_objects
{
    if (argument0 == undefined)
        argument0 = true
    if argument0
        event_pause_all(true)
    instance_deactivate_all(true)
    instance_activate_object(input_controller_object)
    instance_activate_object(obj_gameframe)
    instance_activate_object(obj_pause)
    instance_activate_object(obj_savesystem)
    instance_activate_object(obj_achievementtracker)
    instance_activate_object(obj_drawcontroller)
    with (obj_drawcontroller)
    {
        for (var i = 0; i < 12; i++)
        {
            hold_alarm[i] = alarm[i]
            alarm[i] = -1
        }
        image_speed = hold_image_speed
    }
    instance_activate_object(obj_music)
    instance_activate_object(obj_fmod)
}

function scr_pause_stop_sounds() //scr_pause_stop_sounds
{
    event_stop(global.snd_escaperumble, true)
}

