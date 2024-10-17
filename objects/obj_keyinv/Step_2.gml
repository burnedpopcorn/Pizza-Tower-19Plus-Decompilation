if (playerid.state != (34 << 0))
{
    x = lerp(x, (playerid.xscale == 1 ? (playerid.x - 32) : (playerid.x + 32)), 0.2)
    y = lerp(y, (playerid.y - 16), 0.2)
}
visible = playerid.state != (34 << 0)
image_xscale = playerid.xscale
