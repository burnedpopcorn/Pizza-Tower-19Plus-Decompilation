if instance_exists(obj_player)
{
    var c = 0
    switch obj_player.character
    {
        case "P":
            c = 0
            break
        case "E":
        case "N":
            c = 1
            break
        case "I":
        case "S":
            c = 0
            break
    }

    inwar = obj_player.inwar
    if (global.levelname != "chateau")
        fmod_studio_system_set_parameter_by_name("character", c, true)
}
fmod_studio_system_set_parameter_by_name("highcombo", global.stylethreshold >= 2, true)
if (!obj_pause.pause)
{
    if instance_exists(obj_pillarjohn)
    {
        if (!event_isplaying(pillarmusicID))
            fmod_studio_event_instance_start(pillarmusicID)
        var pillaronscreen = false
        with (obj_pillarjohn)
            pillaronscreen = bbox_in_camera(1, id)
        fmod_studio_system_set_parameter_by_name("pillarfade", pillaronscreen, false)
    }
    else
    {
        fmod_studio_system_set_parameter_by_name("pillarfade", 0, true)
        if event_isplaying(pillarmusicID)
            event_stop(pillarmusicID, true)
    }
}
if global.panic
{
    if ((!inwar) && global.levelname != "dragonslair")
    {
        if (!panicinit)
        {
            panicinit = true
            fmod_studio_event_instance_start(panicmusicID)
            fmod_studio_event_instance_set_parameter_by_name(panicmusicID, "state", 0, true)
            fmod_studio_event_instance_set_parameter_by_name(panicmusicID, "escapestate", 0, true)
            if (global.music != noone)
            {
                if (global.music.event != -4)
                    event_stop(global.music.event, true)
                if (global.music.eventsecret != -4)
                    event_stop(global.music.eventsecret, true)
            }
            fmod_studio_event_instance_set_parameter_by_name(panicmusicID, "state", 0, true)
            fmod_studio_event_instance_set_parameter_by_name(panicmusicID, "escapestate", 0, true)
        }
        else if (global.levelname != "tutorial")
        {
            fmod_studio_event_instance_set_parameter_by_name(panicmusicID, "state", global.laps, true)
            fmod_studio_event_instance_set_parameter_by_name(panicmusicID, "escapestate", (global.escapetime > 61 ? 0 : 1), true)
        }
    }
    if (global.levelname == "dragonslair" && global.music != noone)
        fmod_studio_event_instance_set_parameter_by_name(global.music.event, "state", 1, true)
}
else
{
    if panicinit
    {
        panicinit = false
        event_stop(panicmusicID, true)
        event_perform(ev_collision, obj_richpresence)
    }
    if (global.levelname == "dragonslair" && global.music != noone)
        fmod_studio_event_instance_set_parameter_by_name(global.music.event, "state", 0, true)
}
