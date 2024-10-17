x += hsp
if (hsp != 0)
{
    dust += 1
    if (dust == 40)
    {
        dust = 0
        instance_create_depth(x, (y + 43), 0, obj_cloudeffect)
    }
}
