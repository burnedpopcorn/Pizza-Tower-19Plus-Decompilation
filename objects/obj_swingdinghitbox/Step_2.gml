x = playerid.x
y = playerid.y
if ((!instance_exists(playerid)) || (instance_exists(playerid) && playerid.state != (28 << 0) && playerid.state != (87 << 0)))
    instance_destroy()
