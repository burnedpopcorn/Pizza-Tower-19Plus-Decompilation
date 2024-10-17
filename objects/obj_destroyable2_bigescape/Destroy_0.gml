if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (global.panic == 1)
    {
        repeat (6)
        {
            with (instance_create_depth((x + 32), (y + 32), -1, obj_debris))
                sprite_index = spr_bigpizzadebrisescape
        }
        scr_sound_multiple("event:/sfx/player/collect/topping", x, y)
        add_collect(50)
        with (instance_create_depth((x + 16), y, 0, obj_smallnumber))
            number = "50"
        restore_combo()
        scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
        ds_list_add(global.saveroom, id)
    }
}
