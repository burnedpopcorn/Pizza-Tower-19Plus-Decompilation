function add_music(argument0, argument1, argument2, argument3, argument4) //add_music
{
    if (argument4 == undefined)
        argument4 = -4
    var musicstruct = 
    {
        continuous: argument3,
        event: -4,
        eventsecret: -4,
        mumethod: -4
    }

    with (musicstruct)
    {
        if (argument4 != -4)
            mumethod = method(self, argument4)
        if (argument1 != -4)
        {
            eventname = argument1
            event = event_instance(argument1)
        }
        if (argument2 != -4)
        {
            eventsecretname = argument2
            eventsecret = event_instance(argument2)
        }
    }
    ds_map_set(musicmap, argument0, musicstruct)
}

function stop_music() //stop_music
{
    with (obj_music)
    {
        if (global.music != noone)
        {
            if (global.music.event != -4)
                event_stop(global.music.event, obj_pause.pause)
            if (global.music.eventsecret != -4)
                event_stop(global.music.eventsecret, obj_pause.pause)
        }
        event_stop(pillarmusicID, true)
        event_stop(panicmusicID, true)
        event_stop(global.snd_escaperumble, true)
    }
}

function timeline_wrapauto(argument0, argument1, argument2) //timeline_wrapauto
{
    var pos = fmod_studio_event_instance_get_timeline_position(argument0)
    var length = fmod_studio_event_description_get_length(fmod_studio_system_get_event(argument1))
    fmod_studio_event_instance_set_timeline_position(argument2, wrap(pos, 1, (length - 1)))
}

