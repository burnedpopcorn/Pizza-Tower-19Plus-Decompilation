isexit = asset_has_tags(room, "Secret Room", asset_room)
var _start = false
with (obj_player)
{
    if (targetDoor == "S" && secretportalID == other.id)
    {
        x = other.x
        y = other.y
        roomstartx = x
        roomstarty = y
        _start = true
        instance_destroy(other.id)
        instance_create_depth(x, y, depth, obj_secreteyeexit)
    }
}
if (ds_list_find_index(global.saveroom, id) != -1)
{
    if (!_start)
        instance_destroy()
    else
    {
        active = false
        sprite_index = spr_secretportal_close
        image_index = 0
    }
}
