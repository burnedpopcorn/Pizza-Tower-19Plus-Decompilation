image_xscale = playerid.xscale
x = playerid.x
y = playerid.y
if (playerid.state != (2 << 0) && playerid.state != (103 << 0))
    instance_destroy()
