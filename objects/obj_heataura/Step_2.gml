if (global.stylethreshold < 2)
{
    instance_destroy()
    return;
}
visible = playerid.visible * (!((room == rank_room || room == rank_roomtutorial || room == timesuproom)))
with (playerid)
{
    other.sprite_index = sprite_index
    other.image_index = image_index
    other.mask_index = mask_index
    other.image_xscale = xscale * scale_xs * gravityflip
    other.image_yscale = yscale * scale_ys * gravityflip
    other.image_angle = angle
    other.image_blend = c_white
    other.image_alpha = other.alpha
}
x += (hsp + playerid.x - prevplayerx)
y += (vsp + playerid.y - prevplayery)
effectMapAdd(playerid._player, obj_mach3effect)
prevplayerx = playerid.x
prevplayery = playerid.y
