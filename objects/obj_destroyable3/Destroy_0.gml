if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (4)
    {
        with (instance_create_depth((x + (random_range(0, 32))), (y + (random_range(0, 32))), 2, obj_genericpoofeffect))
            sprite_index = spr_deadjohnsmoke
    }
    repeat (7)
        instance_create_depth((x + (random_range(0, sprite_width))), (y + (random_range(0, sprite_width))), -1, obj_towerblockdebris)
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}
