if instance_exists(obj_player)
{
    if obj_player.pummelpunch
    {
        x = obj_player.x + obj_player.xscale * 30
        y = obj_player.y
    }
    if ((!obj_player.pummelpunch) && floor(image_index) == 6)
        instance_destroy()
}
