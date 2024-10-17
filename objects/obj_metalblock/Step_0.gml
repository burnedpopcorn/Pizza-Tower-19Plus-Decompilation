visible = 1
if place_meeting(x, y, obj_shotgunblast)
{
    if (!shot)
        hp--
    shot = true
}
else
    shot = false
if (hp <= 0)
    instance_destroy()
image_index = clamp((maxhp - hp), 0, (maxhp - 1))
