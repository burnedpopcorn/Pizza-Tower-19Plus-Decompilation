if (scalespr < 1)
    scalespr += 0.2
else
    scalespr = 1
if fade
{
    image_alpha -= 0.1
    if (image_alpha <= 0)
        instance_destroy()
}
if (room == rank_room || room == timesuproom)
    instance_destroy()
