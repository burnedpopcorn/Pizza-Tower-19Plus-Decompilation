hsp = lengthdir_x(spd, image_angle)
vsp = lengthdir_y(spd, image_angle)
event_inherited()
spd = Approach(spd, 0, 0.5)
if (spd <= 1)
{
    if (image_xscale != 0)
    {
        image_xscale = Approach(image_xscale, 0, 0.1)
        image_yscale = image_xscale
    }
    else
        instance_destroy()
}
