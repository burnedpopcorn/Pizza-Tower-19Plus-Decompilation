if (!instance_exists(playerid))
    instance_destroy()
image_xscale = playerid.xscale
x = playerid.x
y = playerid.y
if (playerid.state != (70 << 0) && playerid.taunttimer < 10)
    instance_destroy()
