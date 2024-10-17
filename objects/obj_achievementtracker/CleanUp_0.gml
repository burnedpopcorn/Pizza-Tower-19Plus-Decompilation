for (var i = 0; i < array_length(achievements); i++)
{
    with (achievements[i])
        self.cleanfunc()
}
ds_list_destroy(notifications)
notifications = -1
ds_list_destroy(popupqueue)
popupqueue = -1
ds_map_destroy(variables)
variables = -1
