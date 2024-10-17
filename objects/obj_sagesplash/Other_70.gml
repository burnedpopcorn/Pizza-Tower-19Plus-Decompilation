if (ds_map_find_value(async_load, "type") == "video_start")
    video_set_volume(global.musicvolume * global.mastervolume * 0.3)
else if (ds_map_find_value(async_load, "type") == "video_end")
{
    video_close()
    instance_create_depth(x, y, depth, obj_purefatintro)
    instance_destroy()
}
