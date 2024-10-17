function destroy_sounds(argument0) //destroy_sounds
{
    for (var i = 0; i < array_length(argument0); i++)
    {
        var b = argument0[i]
        event_stop(b, 1)
        fmod_studio_event_instance_release(b)
    }
}

function scr_sound_multiple(argument0, argument1, argument2) //scr_sound_multiple
{
    if (ds_map_find_value(global.sound_map, argument0) == undefined)
        ds_map_set(global.sound_map, argument0, ds_list_create())
    var _list = ds_map_find_value(global.sound_map, argument0)
    for (var i = 0; i < ds_list_size(_list); i++)
    {
        var b = ds_list_find_value(_list, i)
        event_stop(b, 0)
        fmod_studio_event_instance_release(b)
    }
    ds_list_clear(_list)
    b = event_instance(argument0)
    fmod_studio_event_instance_start(b)
    event_set_3d_position(b, argument1, argument2, 0)
    ds_list_add(_list, b)
}

