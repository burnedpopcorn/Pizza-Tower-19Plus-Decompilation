if (vsp < 30)
    vsp += grav
if (hsp == 0)
    image_speed = 0
else
    image_speed = 0.35
if ((!scr_slope()) && (scr_solid((x + 1), y) || scr_solid((x - 1), y)))
{
    instance_destroy()
    instance_create_depth(x, (y + 10), -1, obj_skateboarddebris1)
    instance_create_depth(x, (y + 10), 0, obj_skateboarddebris2)
}
scr_collide()
