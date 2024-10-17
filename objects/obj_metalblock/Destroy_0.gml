if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (5)
        instance_create_depth((x + 32), (y + 32), -1, obj_metaldebris)
    camera_shake(20, 40)
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/metalbreak", x, y)
    ds_list_add(global.saveroom, id)
}
depth = 1
