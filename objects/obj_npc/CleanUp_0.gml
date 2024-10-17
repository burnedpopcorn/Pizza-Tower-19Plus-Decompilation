var _keys = ds_map_keys_to_array(sounds)
for (var i = 0; i < array_length(_keys); i++)
    destroy_sounds([ds_map_find_value(sounds, array_get(_keys, i))])
ds_map_destroy(sounds)
sounds = -1
if surface_exists(dialoguebubblesurf)
    surface_free(dialoguebubblesurf)
if surface_exists(nameboxsurf)
    surface_free(nameboxsurf)
