if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create_depth((x + 32), (y + 32), -1, obj_metaldebris))
        sprite_index = spr_cheeseballblockdebris
    with (instance_create_depth((x + 32), (y + 32), -1, obj_metaldebris))
        sprite_index = spr_cheeseballblockdebris
    with (instance_create_depth((x + 32), (y + 32), -1, obj_metaldebris))
        sprite_index = spr_cheeseballblockdebris
    with (instance_create_depth((x + 32), (y + 32), -1, obj_metaldebris))
        sprite_index = spr_cheeseballblockdebris
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}
