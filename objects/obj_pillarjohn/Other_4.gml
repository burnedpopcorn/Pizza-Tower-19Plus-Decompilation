if (ds_list_find_index(global.saveroom, id) != -1)
{
    instance_destroy(id, false)
    if (room == dragonslair_1 && layer_exists(layer_get_id("dragonlair_backgroundrain")))
        layer_set_visible(layer_get_id("dragonlair_backgroundrain"), true)
}
if (global.snickchallenge == 1)
    instance_destroy()
