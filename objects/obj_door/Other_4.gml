if (ds_list_find_index(global.saveroom, id) != -1)
    visited = 1
if place_meeting(x, y, obj_player)
{
    if (ds_list_find_index(global.saveroom, id) == -1)
        ds_list_add(global.saveroom, id)
    visited = 1
}
if escape
{
    if global.panic
        sprite_index = spr_blockeddoor
}
