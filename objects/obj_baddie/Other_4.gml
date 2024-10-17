if (ds_list_find_index(global.baddieroom, id) != -1)
{
    instance_destroy(id, false)
    return;
}
if escape
{
    if (escapespawnID == -4)
    {
        with (instance_create_depth(x, y, (depth + 1), obj_escapespawn))
        {
            baddieID = other.id
            other.escapespawnID = id
        }
        instance_deactivate_object(id)
    }
}
