if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy()
else
    ds_list_add(global.saveroom, id)
