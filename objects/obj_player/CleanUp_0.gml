if (_player == 1)
{
    ds_list_destroy(global.saveroom)
    global.saveroom = -1
    ds_list_destroy(global.instancelist)
    global.instancelist = -1
    ds_list_destroy(global.baddiecollidelist)
    global.baddiecollidelist = -1
    ds_list_destroy(global.collectspawn)
    global.collectspawn = -1
    ds_list_destroy(global.baddieroom)
    global.baddieroom = -1
    ds_list_destroy(global.escaperoom)
    global.escaperoom = -1
    ds_list_destroy(global.waveroom)
    global.waveroom = -1
    ds_list_destroy(global.boxlist)
    global.boxlist = -1
    ds_list_destroy(global.escapecollect)
    global.escapecollect = -1
    ds_map_destroy(global.Pal_Map)
    global.Pal_Map = -1
    if surface_exists(global.bg_surface)
    {
        surface_free(global.bg_surface)
        global.bg_surface = -1
    }
}
