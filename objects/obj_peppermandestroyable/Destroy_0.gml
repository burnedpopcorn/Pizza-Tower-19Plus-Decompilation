if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create_depth((x + 16), y, -1, obj_debris)
    instance_create_depth((x + 16), y, -1, obj_debris)
    instance_create_depth((x + 16), y, -1, obj_debris)
    instance_create_depth((x + 16), y, -1, obj_debris)
    ds_list_add(global.saveroom, id)
}
