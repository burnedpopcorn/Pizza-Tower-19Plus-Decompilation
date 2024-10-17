hsp = image_xscale * movespeed
if ((!scr_slope()) && instance_place((x + sign(hsp)), y, obj_solid))
{
    repeat (8)
        instance_create_depth(x, y, -1, obj_slimedebris)
    instance_destroy()
}
scr_collide()
