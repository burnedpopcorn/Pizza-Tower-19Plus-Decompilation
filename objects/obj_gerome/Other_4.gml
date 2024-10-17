if persistent
    event_inherited()
if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy()
if scr_treasureroomcheck()
{
    ds_list_add(global.saveroom, id)
    instance_destroy()
}
