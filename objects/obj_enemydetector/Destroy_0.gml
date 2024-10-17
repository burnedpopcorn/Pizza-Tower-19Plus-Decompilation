if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (global.panic == 1 && (!instance_number(obj_enemyspawn)))
        ds_list_add(global.saveroom, id)
}
