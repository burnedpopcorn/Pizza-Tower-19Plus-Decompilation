if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (7)
    {
        with (instance_create_depth((x + sprite_width / 2), (y + sprite_height / 2), -1, obj_debris))
            sprite_index = spr_wooddebris2
    }
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}
