if (!global.panic)
{
    var mu = ds_map_find_value(musicmap, room)
    if (!is_undefined(mu))
    {
        var prevmusic = global.music
        if (prevmusic == noone || mu.eventname != prevmusic.eventname)
        {
            fmod_studio_event_instance_start(mu.event)
            fmod_studio_event_instance_set_paused(mu.event, false)
            if (mu.continuous && prevmusic != noone)
                timeline_wrapauto(prevmusic.eventsecret, mu.eventname, mu.event)
            if (prevmusic != noone)
            {
                if (prevmusic.event != -4)
                    event_stop(prevmusic.event, true)
                if (prevmusic.eventsecret != -4)
                    event_stop(prevmusic.eventsecret, true)
            }
            global.music = mu
        }
    }
    if (global.music != noone && global.music.mumethod != -4)
        global.music.mumethod(room)
}
var _prevsecret = secret
secret = asset_has_tags(room, "Secret Room", 3)
if (global.music != noone && global.music.eventsecret != -4)
{
    if secret
    {
        fmod_studio_event_instance_start(global.music.eventsecret)
        fmod_studio_event_instance_set_paused(global.music.eventsecret, false)
        var _ev = global.music.event
        if ((!inwar) && global.levelname != "dragonslair")
        {
            if global.panic
                _ev = panicmusicID
        }
        timeline_wrapauto(_ev, global.music.eventsecretname, global.music.eventsecret)
        fmod_studio_event_instance_set_paused(global.music.event, true)
        fmod_studio_event_instance_set_paused(panicmusicID, true)
        fmod_studio_event_instance_set_paused(global.snd_escaperumble, true)
    }
    else if (_prevsecret == 1)
    {
        event_stop(global.music.eventsecret, true)
        fmod_studio_event_instance_set_paused(global.music.event, false)
        fmod_studio_event_instance_set_paused(panicmusicID, false)
        fmod_studio_event_instance_set_paused(global.snd_escaperumble, false)
    }
}
if (room == rank_room || room == timesuproom || room == virtualinsanity)
{
    if (global.music != noone)
    {
        if (global.music.event != -4)
            event_stop(global.music.event, true)
        if (global.music.eventsecret != -4)
            event_stop(global.music.eventsecret, true)
        event_stop(pillarmusicID, true)
        event_stop(panicmusicID, true)
        event_stop(global.snd_escaperumble, true)
    }
}
if (room == Scootertransition)
    fmod_studio_event_instance_start(global.windloop)
fmod_studio_system_set_parameter_by_name("inmart", instance_exists(obj_pizzamartinterior), false)
