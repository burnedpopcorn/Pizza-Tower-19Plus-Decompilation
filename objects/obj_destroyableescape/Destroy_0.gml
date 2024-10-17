if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (global.panic == 1)
    {
        with (instance_create_depth(x, y, 0, obj_baddiedead))
            sprite_index = spr_destroyableescape_dead
        scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
        ds_list_add(global.saveroom, id)
    }
}
