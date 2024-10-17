event_inherited()
hsp = Approach(hsp, 0, 0.5)
if fadeout
{
    image_alpha -= 0.05
    if (image_alpha <= 0)
        instance_destroy()
}
