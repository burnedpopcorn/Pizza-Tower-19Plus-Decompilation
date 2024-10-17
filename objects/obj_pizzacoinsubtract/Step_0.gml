image_alpha += 0.1
if (image_alpha >= 1)
    image_alpha = 1
vsp += grav
yoff += vsp
if (yoff >= 0)
{
    obj_pizzacoinindicator.squish = 0.5
    instance_destroy()
}
depth = obj_pizzacoinindicator.depth
