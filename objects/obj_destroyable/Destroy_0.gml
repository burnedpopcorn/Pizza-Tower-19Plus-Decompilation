if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create_depth((x + 16), (y + 16), 2, obj_genericpoofeffect))
        sprite_index = spr_deadjohnsmoke
    repeat (2)
        instance_create_depth((x + 16), (y + 16), -1, obj_towerblockdebris)
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}
