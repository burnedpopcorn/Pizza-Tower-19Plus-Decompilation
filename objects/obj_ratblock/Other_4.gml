if (ds_list_find_index(global.saveroom, id) != -1)
    instance_destroy(id, false)
else
{
    if (place_meeting((x + 1), y, object_index) && place_meeting((x - 1), y, object_index))
        shouldsniff = false
    if (place_meeting((x + 1), y, object_index) && (!(place_meeting((x - 1), y, object_index))))
        shouldsniff = false
}
