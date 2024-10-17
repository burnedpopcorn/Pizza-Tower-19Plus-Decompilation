if (sprite_index == spr_pizzaportalend)
{
    sprite_index = spr_pizzaportal
    with (obj_player)
    {
        ds_list_clear(global.escapecollect)
        global.switchblock = (!global.switchblock)
        var rm = virtualinsanity
        var door = "A"
        switch room
        {
            case entry_1b:
                rm = entry_10
                door = "M"
                break
            case medieval_1:
                rm = medieval_10
                door = "M"
                break
            case ruin_1:
                rm = ruin_10
                door = "M"
                break
            case dungeon_1:
                rm = dungeon_10
                door = "M"
                break
        }

        targetRoom = rm
        targetDoor = door
        if (!instance_exists(obj_fadeout))
            instance_create_depth(x, y, -9999, obj_fadeout)
        for (var i = 0; i < ds_list_size(global.escaperoom); i++)
        {
            var b = ds_list_find_value(global.escaperoom, i)
            var q = ds_list_find_index(global.baddieroom, b)
            var t = 0
            if (q == -1)
            {
                q = ds_list_find_index(global.saveroom, b)
                t = 1
            }
            if (q != -1)
            {
                if (!t)
                    ds_list_delete(global.baddieroom, q)
                else
                    ds_list_delete(global.saveroom, q)
            }
        }
    }
}
