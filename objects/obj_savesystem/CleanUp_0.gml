var i, _demos;

for (i = 0; i < array_length(global.levels); i++)
{
    if (ds_map_find_value(global.timetrialreplays, global.levels[i]) != -1)
        buffer_delete(array_get(ds_map_find_value(global.timetrialreplays, global.levels[i]), 1));
    
    ds_map_set(global.timetrialreplays, global.levels[i], -1);
    ds_map_destroy(ds_map_find_value(global.timetrialsavedsplits, global.levels[i]));
    ds_map_set(global.timetrialsavedsplits, global.levels[i], -1);
    ds_list_destroy(ds_map_find_value(global.pizzacointracker, global.levels[i]));
    ds_map_set(global.pizzacointracker, global.levels[i], -1);
}

ds_map_destroy(global.timetrialreplays);
global.timetrialreplays = -1;
ds_map_destroy(global.timetrialsavedsplits);
global.timetrialsavedsplits = -1;
ds_map_destroy(global.pizzacointracker);
global.pizzacointracker = -1;

if (buffer_exists(demosavebuff))
    buffer_delete(demosavebuff);

try
{
    if (!ds_map_empty(demoloadbuffs))
    {
        _demos = ds_map_keys_to_array(demoloadbuffs);
        
        for (i = 0; i < array_length(_demos); i++)
            buffer_delete(ds_map_find_value(demoloadbuffs, array_get(_demos, i)));
    }
    
    ds_map_destroy(demoloadbuffs);
}
catch (_ex)
{
}
