if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create_depth((x + 16), y, -1, obj_debris))
    {
        sprite_index = spr_ballblockdebris
        image_index = 0
    }
    repeat (4)
    {
        with (instance_create_depth((x + 16), y, -1, obj_debris))
        {
            sprite_index = spr_ballblockdebris
            image_index = irandom(3) + 1
        }
    }
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}
