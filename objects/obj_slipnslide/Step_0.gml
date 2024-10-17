scr_collide()
if grounded
    hsp = 0
if (banana >= 2)
{
    instance_create_depth(x, (y + 5), -8, obj_genericpoofeffect)
    instance_destroy()
}
if (baddieID != noone && (!instance_exists(baddieID)))
{
    instance_create_depth(x, (y + 5), -8, obj_genericpoofeffect)
    instance_destroy()
}
