image_xscale = playerid.xscale
x = playerid.x
y = playerid.y
if ((playerid.state != (91 << 0) && playerid.state != (113 << 0)) || (playerid.state == (91 << 0) && playerid.sprite_index == playerid.spr_kungfubump))
    instance_destroy()
