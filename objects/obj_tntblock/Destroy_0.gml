if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create_depth((x + 32), (y + 32), 0, obj_bombexplosion2)
    repeat (6)
        instance_create_depth((x + 32), (y + 32), -1, obj_tntblockdebris)
    ds_list_add(global.saveroom, id)
}
with (instance_place((x + 1), y, obj_rockblock))
    alarm[1] = 8
with (instance_place((x - 1), y, obj_rockblock))
    alarm[1] = 8
with (instance_place(x, (y + 1), obj_rockblock))
    alarm[1] = 8
with (instance_place(x, (y - 1), obj_rockblock))
    alarm[1] = 8
