if (ds_list_find_index(global.baddieroom, id) == -1)
{
    instance_create_depth(x, y, 0, obj_bombexplosion)
    repeat (6)
        instance_create_depth(x, y, -1, obj_wooddebris)
    ds_list_add(global.baddieroom, id)
}
