x = playerid.x
y = playerid.y
image_xscale = playerid.xscale
with (playerid)
{
    if (state != (66 << 0))
        instance_destroy(other.id)
}
