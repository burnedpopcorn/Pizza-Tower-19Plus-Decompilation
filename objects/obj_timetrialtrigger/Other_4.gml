if (!global.timetrial)
{
    instance_destroy()
    return;
}
var _id = string_concat(room_get_name(room), "|", xstart, "|", ystart)
if (ds_list_find_index(global.saveroom, _id) != -1)
    instance_destroy()
