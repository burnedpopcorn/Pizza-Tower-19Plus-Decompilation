if (ds_list_find_index(global.saveroom, id) != -1)
{
    instance_destroy()
    return;
}
save_open()
var _id = string_concat(room_get_name(room), "|", xstart, "|", ystart)
if (global.levelname == -4 || ds_list_find_index(ds_map_find_value(global.pizzacointracker, global.levelname), _id) != -1)
{
    collectmode = true
    image_alpha = 0.5
}
save_close()
