if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create_depth((x + 32), (y + 32), -1, obj_supermetaldebris)
    instance_create_depth((x + 32), (y + 32), -1, obj_supermetaldebris)
    instance_create_depth((x + 32), (y + 32), -1, obj_supermetaldebris)
    instance_create_depth((x + 32), (y + 32), -1, obj_supermetaldebris)
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    camera_shake(20, 40)
    scr_fmod_soundeffectONESHOT("event:/sfx/misc/metalbreak", x, y)
    ds_list_add(global.saveroom, id)
}
depth = 1
